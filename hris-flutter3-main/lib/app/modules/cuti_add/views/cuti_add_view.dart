import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris/app/component/app_bar.dart';
import 'package:hris/app/form/button.dart';
import 'package:hris/app/form/form_date.dart';
import 'package:hris/app/form/form_input.dart';
import 'package:hris/app/form/form_select.dart';

import '../controllers/cuti_add_controller.dart';

class CutiAddView extends GetView<CutiAddController> {
  const CutiAddView({Key? key}) : super(key: key);
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
            Obx(
              () => controller.list.isNotEmpty
                  ? FormSelect(
                      label: "Pilih Pengajuan",
                      listData: controller.list.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['label']),
                          value: item['kode_cuti'],
                        );
                      }).toList(),
                      icon: Icons.outbox_rounded,
                      initialValue: controller.kodeCuti.value,
                      onChanged: (value) {
                        controller.kodeCuti.value = value.toString();
                      },
                    )
                  // ? Text(controller.list.toString())
                  : const SizedBox(),
            ),
            FormDate(
              change: (value) =>
                  controller.tanggalMulai.value = value.toString(),
              init: DateTime.now(),
              label: "Tanggal Mulai",
            ),
            FormDate(
              change: (value) =>
                  controller.tanggalSelesai.value = value.toString(),
              init: DateTime.now(),
              label: "Tanggal Selesai",
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
