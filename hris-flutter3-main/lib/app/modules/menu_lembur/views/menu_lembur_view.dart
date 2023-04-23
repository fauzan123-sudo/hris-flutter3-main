import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris/app/component/app_bar.dart';
import 'package:hris/app/component/card_menu.dart';
import 'package:hris/app/routes/app_pages.dart';

import '../controllers/menu_lembur_controller.dart';

class MenuLemburView extends GetView<MenuLemburController> {
  const MenuLemburView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Container(
        color: Colors.blue[50],
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Pengajuan Lembur',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent[500],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.LEMBUR_ADD),
                    child: Column(
                      children: [
                        Container(
                          child: const Icon(
                            Icons.add_circle,
                            size: 28,
                            color: Colors.blue,
                          ),
                        ),
                        const Text(
                          'TAMBAH',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controller.isDataProcessing.value == true) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              } else {
                if (controller.listData.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.listData.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == controller.listData.length - 1 &&
                            controller.isMoreDataAvailable.value == true) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          );
                        }
                        return CardMenu(
                          title: "Lembur",
                          color: "0xff0b945e",
                          status: controller.listData[index]['status'],
                          keterangan:
                              "Pengajuan Lembur \nTanggal ${controller.listData[index]['tanggal']}",
                          press: () => Get.toNamed(
                            Routes.LEMBUR_DETAIL,
                            arguments: controller.listData[index],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Data tidak ditemukan',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
