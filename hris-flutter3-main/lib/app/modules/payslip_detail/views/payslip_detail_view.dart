import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris/app/component/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/payslip_detail_controller.dart';

class PayslipDetailView extends GetView<PayslipDetailController> {
  const PayslipDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return Scaffold(
      appBar: const AppBarCustom(),
      body: controller.data['slip_url'].toString() != ""
          ? WebView(
              key: UniqueKey(),
              initialUrl: controller.data['slip_url'].toString(),
              javascriptMode: JavascriptMode.unrestricted,
            )
          // Tested android not running without SSL
          : const CircularProgressIndicator(
              color: Colors.red,
            ),
    );
  }
}
