import 'dart:convert';

import 'package:geotagging/utility/shared/constants/storage_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/infrastructure/signin/models/pegawai_profile.dart';

class Helper {
  var storage = Get.find<SharedPreferences>();

  PegawaiProfile get getPegawaiProfile {
    String? pegawai = storage.getString(StorageConstants.pegawai);
    return PegawaiProfile.fromMap(json.decode(pegawai!));
  }
}
