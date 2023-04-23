import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris/app/component/app_bar.dart';
import 'package:hris/app/form/button.dart';
import 'package:hris/app/form/form_date.dart';
import 'package:hris/app/form/form_input.dart';
import 'package:hris/app/form/form_time.dart';

import '../controllers/lembur_add_controller.dart';

class LemburAddView extends GetView<LemburAddController> {
  const LemburAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FormDate(
              change: (value) => controller.tanggal.value = value.toString(),
              init: DateTime.now(),
              label: "Tanggal Mulai",
            ),
            FormTime(
              control: controller.mulai,
              title: 'Waktu Mulai',
              icon: Icons.more_time_rounded,
              tap: () => controller.showMulai(),
            ),
            FormTime(
              control: controller.selesai,
              title: 'Waktu Selsai',
              icon: Icons.timer_off_rounded,
              tap: () => controller.showSelesai(),
            ),
            FormInput(
              control: controller.keterangan,
              title: "Keterangan",
              icon: Icons.message,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Button(
                fnc: () => controller.sendData(),
                animate: controller.animate.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
