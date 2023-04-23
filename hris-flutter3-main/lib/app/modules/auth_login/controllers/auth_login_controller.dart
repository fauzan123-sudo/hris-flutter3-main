import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hris/app/data/providers/user_provider.dart';
import 'package:hris/app/function/alert.dart';
import 'package:hris/app/routes/app_pages.dart';

class AuthLoginController extends GetxController {
  final hide = true.obs;
  final animate = false.obs;
  final imei = ''.obs;
  late TextEditingController email;
  late TextEditingController password;

  void login() {
    if (email.text != '' && password.text != '' && imei.value != '') {
      try {
        animate.value = true;
        UserProvider()
            .login(email.text, password.text, imei.value)
            .then((value) {
          if (value.body == null || value.body == '') {
            animate.value = false;
            dialogError('Pastikan Koneksi Internet Anda Baik!');
          } else {
            if (value.body['access_token'] != null) {
              final data = value.body;
              final box = GetStorage();
              box.write('dataUser', {
                'name': data['user']['name'].toString(),
                'no_hp': data['user']['no_hp'].toString(),
                'email': data['user']['email'].toString(),
                'nip': data['user']['nip'].toString(),
                'jabatan': data['user']['nama_jabatan'].toString(),
                'skpd': data['user']['skpd'].toString(),
                'images': data['user']['images'].toString(),
                'access_token': data['access_token'].toString(),
              });
              Get.offAllNamed(Routes.NAVIGATION_BOTTOM);
            } else {
              animate.value = false;
              dialogError(value.body['message']);
            }
          }
        });
      } catch (e) {
        dialogError('Pastikan Koneksi Internet Anda Baik!');
      }
    } else {
      dialogError('NIP dan Password wajib diisi!');
    }
  }

  Future<void> getImei() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      imei.value = iosDeviceInfo.identifierForVendor.toString();
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      imei.value = androidDeviceInfo.androidId.toString() +
          "." +
          androidDeviceInfo.fingerprint.toString();
    }
  }

  void onInit() {
    getImei();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
