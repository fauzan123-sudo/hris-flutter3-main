import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris/app/component/banner.dart';
import 'package:hris/app/component/child/navigation_bar_bottom.dart';
import 'package:hris/app/component/item_kategori.dart';
import 'package:hris/app/component/navigation.dart';
import 'package:hris/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          alignment: Alignment.centerLeft,
          height: 40,
          // child: Image.asset(
          //   "assets/logo/pehadirlogo.png",
          //   color: Colors.white,
          //   fit: BoxFit.cover,
          // ),
          child: const Text('HAERDE'),
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.logout(),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 30,
              height: 30,
              child: const Icon(Icons.logout),
            ),
          ),
        ],
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 120,
              width: Get.width,
              color: Colors.blue[700],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 2, top: 2, right: 2, bottom: 2),
                      alignment: AlignmentDirectional.center,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          child: ClipOval(
                            child: controller.dataUser['images'] != ""
                                ? Image.network(controller.dataUser['images'])
                                : Image.asset("assets/images/profile_logo.png"),
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Selamat Datang, ',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.dataUser['name'] +
                                    '\n' +
                                    controller.dataUser['jabatan'].toString() +
                                    '\n' +
                                    controller.dataUser['skpd'].toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white60,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Layanan Kami",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ItemKategori(
                                            title: "Presensi",
                                            color: const Color(0xff5369f8),
                                            icon: Icons.location_on,
                                            tap: () => Get.toNamed(
                                              Routes.MENU_PRESENSI,
                                            ),
                                          ),
                                          ItemKategori(
                                            title: "Visit",
                                            color: const Color(0xffec1d27),
                                            icon: Icons.share_location_sharp,
                                            tap: () => Get.toNamed(
                                              Routes.MENU_VISIT,
                                            ),
                                          ),
                                          ItemKategori(
                                            title: "Cuti",
                                            color: const Color(0xff68a9e3),
                                            icon: Icons.timer_sharp,
                                            tap: () => Get.toNamed(
                                              Routes.MENU_CUTI,
                                            ),
                                          ),
                                          ItemKategori(
                                            title: "Lembur",
                                            color: const Color(0xff0b945e),
                                            icon: Icons.timelapse_sharp,
                                            tap: () => Get.toNamed(
                                              Routes.MENU_LEMBUR,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ItemKategori(
                                            title: "Reimbur\nsement",
                                            color: const Color(0xff14639e),
                                            icon: Icons.receipt_long_outlined,
                                            tap: () => Get.toNamed(
                                              Routes.MENU_REIMBURSEMENT,
                                            ),
                                          ),
                                          ItemKategori(
                                            title: "Shift",
                                            color: const Color(0xff72d2a2),
                                            icon: Icons.calendar_today_outlined,
                                            tap: () =>
                                                Get.toNamed(Routes.MENU_SHIFT),
                                          ),
                                          ItemKategori(
                                            title: "Payslip",
                                            color: Colors.amber,
                                            icon: Icons.library_books_outlined,
                                            tap: () => Get.toNamed(
                                                Routes.MENU_PAYSLIP),
                                          ),
                                          ItemKategori(
                                            title: "Perusahaan",
                                            color: const Color(0xff8dc53e),
                                            icon: Icons.corporate_fare,
                                            tap: () => Get.toNamed(
                                              Routes.MENU_PERUSAHAAN,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 6,
                                  width: Get.width,
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Pengumuman",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                Get.toNamed(Routes.PENGUMUMAN),
                                            child: const Text(
                                              "Lihat Semua",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Obx(
                                          () => Row(
                                            children: controller.listPengumuman
                                                .map(
                                                  (item) => BannerPage(
                                                    image:
                                                        item['file'].toString(),
                                                    tap: () => Get.toNamed(
                                                      Routes.PENGUMUMAN_DETAIL,
                                                      arguments: item,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Navigation
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key? key,
    required this.title,
    required this.data,
    required this.satuan,
  }) : super(key: key);

  final String title;
  final String data;
  final String satuan;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            RichText(
              text: TextSpan(
                text: data,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xFFEC2028),
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: " $satuan",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF747D8C),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
