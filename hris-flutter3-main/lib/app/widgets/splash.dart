import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset("assets/lottie/welcome.json"),
              ),
              // Text(
              //   "HR SISTEM",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.blue[800],
              //   ),
              // ),
              CircularProgressIndicator(
                color: Colors.blue[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
