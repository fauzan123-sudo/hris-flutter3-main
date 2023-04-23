import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hris/app/data/lembur_provider.dart';
import 'package:hris/app/function/alert.dart';
import 'package:hris/app/routes/app_pages.dart';

class LemburAddController extends GetxController {
  final tanggal = ''.obs;
  final TextEditingController keterangan = TextEditingController();
  final TextEditingController mulai = TextEditingController();
  final TextEditingController selesai = TextEditingController();
  final animate = false.obs;
  final dataUser = GetStorage().read('dataUser');

  Future<void> showMulai() async {
    final split = mulai.text.split(':');
    final TimeOfDay? result = await showTimePicker(
      context: Get.context!,
      initialTime: mulai.text != ''
          ? TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]))
          : TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onSurface: Colors.black,
            ),
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.blue,
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          ),
        );
      },
    );
    if (result != null) {
      mulai.text = result.hour.toString() + ':' + result.minute.toString();
    }
  }

  Future<void> showSelesai() async {
    final split = selesai.text.split(':');
    final TimeOfDay? result = await showTimePicker(
      context: Get.context!,
      initialTime: selesai.text != ''
          ? TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]))
          : TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onSurface: Colors.black,
            ),
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.blue,
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          ),
        );
      },
    );
    if (result != null) {
      selesai.text = result.hour.toString() + ':' + result.minute.toString();
    }
  }

  void sendData() {
    try {
      animate.value = true;
      LemburProvider()
          .postLembur(
        dataUser['access_token'],
        dataUser['nip'],
        tanggal.value.toString(),
        mulai.text,
        selesai.text,
        keterangan.text,
      )
          .then((value) {
        final data = value.body;
        print(data);
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
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
