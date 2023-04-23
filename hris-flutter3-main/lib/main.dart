import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hris/app/widgets/splash.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataUser = GetStorage().read('dataUser');

    // Dev Only
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HAERDE",
      initialRoute:
          dataUser == null ? Routes.AUTH_LOGIN : Routes.NAVIGATION_BOTTOM,
      getPages: AppPages.routes,
    );
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 3700)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "HAERDE",
            initialRoute:
                dataUser == null ? Routes.AUTH_LOGIN : Routes.NAVIGATION_BOTTOM,
            getPages: AppPages.routes,
          );
        }
      },
    );
  }
}
