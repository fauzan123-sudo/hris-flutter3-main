import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris/app/component/app_bar.dart';
import 'package:hris/app/component/child/navigation_bar_bottom.dart';

import '../controllers/presensi_laporan_controller.dart';
import 'package:intl/intl.dart';

class PresensiLaporanView extends GetView<PresensiLaporanController> {
  const PresensiLaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () async {
                        final picked = await showDateRangePicker(
                          context: context,
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData(
                                primarySwatch: Colors.grey,
                                splashColor: Colors.blue,
                                textTheme: const TextTheme(
                                  subtitle1: TextStyle(color: Colors.blue),
                                  button: TextStyle(color: Colors.blue),
                                ),
                                colorScheme: const ColorScheme.light(
                                    primary: Colors.blue,
                                    onSecondary: Colors.blue,
                                    onPrimary: Colors.white,
                                    surface: Colors.blue,
                                    onSurface: Colors.blue,
                                    secondary: Colors.blue),
                                dialogBackgroundColor: Colors.white,
                              ),
                              child: child ?? Text(""),
                            );
                          },
                          initialDateRange: DateTimeRange(
                            start: DateTime.parse(DateFormat('yyyy-MM-dd')
                                .format(DateFormat('dd-MM-yyyy')
                                    .parse(controller.pickedStart.value))),
                            end: DateTime.parse(DateFormat('yyyy-MM-dd').format(
                                DateFormat('dd-MM-yyyy')
                                    .parse(controller.pickedEnd.value))),
                          ),
                          lastDate: DateTime.now(),
                          firstDate: DateTime(2021 - 01 - 01),
                        );
                        if (picked != null) {
                          controller.pickedStart.value =
                              DateFormat('dd-MM-yyyy')
                                  .format(picked.start)
                                  .toString();
                          controller.pickedEnd.value = DateFormat('dd-MM-yyyy')
                              .format(picked.end)
                              .toString();
                          controller.getLaporan();
                        }
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Obx(
                                () => Text(
                                  controller.pickedStart.value +
                                      " - " +
                                      controller.pickedEnd.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      child: ListView.builder(
                        // controller: controller.scrollController,
                        itemCount: controller.listData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      controller.listData[index]['tanggal'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.blue[50],
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Presensi Masuk',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                controller.listData[index]
                                                    ['jam_pagi'],
                                                style: const TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.blue[50],
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Presensi Pulang',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                controller.listData[index]
                                                    ['jam_sore'],
                                                style: const TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
