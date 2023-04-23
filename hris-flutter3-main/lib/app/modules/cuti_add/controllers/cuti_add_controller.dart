import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hris/app/data/cuti_provider.dart';
import 'package:hris/app/function/alert.dart';
import 'package:hris/app/routes/app_pages.dart';

class CutiAddController extends GetxController {
  final kodeCuti = ''.obs;
  final tanggalMulai = ''.obs;
  final tanggalSelesai = ''.obs;
  final animate = false.obs;
  final TextEditingController keterangan = TextEditingController();
  final dataUser = GetStorage().read('dataUser');
  final List<dynamic> list = [].obs;

  void getMasterCuti() {
    list.add({'value': '', 'kode_cuti': '', 'label': 'Pilih'});
    try {
      CutiProvider().getMasterCuti(dataUser['access_token']).then((value) {
        list.addAll(value.body);
      });
    } catch (e) {
      print(e);
    }
  }

  void sendData() {
    try {
      animate.value = true;
      CutiProvider()
          .postCuti(
        dataUser['access_token'],
        dataUser['nip'],
        tanggalMulai.value.toString(),
        tanggalSelesai.value.toString(),
        kodeCuti.value.toString(),
        keterangan.text,
      )
          .then((value) {
        final data = value.body;
        animate.value = false;
        if (data['status'] == true) {
          dialogSuccess('Berhasil Mengajukan!',
              () => Get.offAllNamed(Routes.NAVIGATION_BOTTOM));
        } else {
          dialogError('Gagal Mengajukan!');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getMasterCuti();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
