import 'package:get/get.dart';
import 'package:hris/app/modules/home/controllers/home_controller.dart';
import 'package:hris/app/modules/pengumuman/controllers/pengumuman_controller.dart';
import 'package:hris/app/modules/presensi_laporan/controllers/presensi_laporan_controller.dart';
import 'package:hris/app/modules/profil/controllers/profil_controller.dart';

import '../controllers/navigation_bottom_controller.dart';

class NavigationBottomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBottomController>(
      () => NavigationBottomController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PengumumanController>(
      () => PengumumanController(),
    );
    Get.lazyPut<PresensiLaporanController>(
      () => PresensiLaporanController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
