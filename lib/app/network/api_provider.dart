// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  Future<Either<GenericException, Response>> getData(String path,
      {Map<String, dynamic>? params}) async {
    try {
      var response = await _dio.get(path, queryParameters: params);

      return Right(response);
    } on DioError catch (ex) {
      EasyLoading.dismiss();
      return Left(
        GenericException(code: ExceptionCode.unknown, info: ex.type.name),
      );
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
