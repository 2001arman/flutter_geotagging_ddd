// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../common/exception.dart';

class ApiProvider {
  static const String tagName = 'APIProvider';

  final String baseUrl = 'https://skripsi.armanmaulana.com/api/';

  late bool isConnected = false;
  late Dio _dio;

  var tokenDio = Dio();
  String? token;
  late BaseOptions dioOptions;
  late Directory dir;

  ApiProvider() {
    dioOptions = BaseOptions()..baseUrl = baseUrl;
    dioOptions.validateStatus = (value) {
      return value! < 500;
    };

    _dio = Dio(dioOptions);
    tokenDio.options = _dio.options;

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  noInternetWarning() async {
    await Get.defaultDialog(
      title: 'No Internet',
      titlePadding: const EdgeInsets.all(20),
      titleStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsets.only(bottom: 20, left: 14, right: 14),
      middleText: 'Please check your connectivity!',
      middleTextStyle: const TextStyle(
        fontSize: 10,
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          shadowColor: Colors.transparent,
          textStyle: Get.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: 12.44,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: const Text('Try Again'),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          shadowColor: Colors.transparent,
          textStyle: Get.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: 12.44,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: const Text('Close'),
      ),
    );
  }

  void throwIfNoSuccess(DioError ex) async {
    if (ex.response!.statusCode! < 200 || ex.response!.statusCode! > 299) {
      Get.log("Gagal Oy,,, ${json.decode(ex.response.toString())["message"]}");
      String errorMessage = json.decode(ex.response.toString())['message'] ??
          json.decode(ex.response.toString())['code'];
      Get.snackbar(
        'Oops..',
        errorMessage,
        backgroundColor: const Color(0xFF3F4E61),
      );
      throw Exception(errorMessage);
    }
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.back();
      isConnected = false;
      noInternetWarning();
    } else {
      isConnected = true;
    }
  }

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    // try {
    // await addAuthorOpt();
    var response = await _dio.get(path, queryParameters: params);
    return response;
    // } on DioError catch (ex) {
    //   EasyLoading.dismiss();
    //   Get.log('===== DioError ${ex.response} || ${ex.error} || ${ex.message}');
    //   throw Exception(ex.response);
    // }
  }

  Future<Response> post(String path) async {
    try {
      var response = await _dio.post(path);
      return response;
    } on DioError catch (ex) {
      throw Exception(json.decode(ex.response.toString())['message']);
    }
  }

  Future<Response> postWithRequestBody(
      String path, Map<String, dynamic> body) async {
    try {
      var response = await _dio.post(path, data: body);
      return response;
    } on DioError catch (e) {
      throw Exception(json.decode(e.response.toString())['message']);
    }
  }

  Future<Either<GenericException, Response>> postData(
      String path, dynamic data) async {
    try {
      var response = await _dio.post(path, data: data);
      if (response.data['status'] == 'failed') {
        return Left(
          GenericException(
            code: ExceptionCode.unknown,
            info: response.data['message'],
          ),
        );
      }
      return Right(response);
    } on DioException catch (ex) {
      EasyLoading.dismiss();
      return Left(
        GenericException(code: ExceptionCode.unknown, info: ex.type.name),
      );
    }
  }
}
