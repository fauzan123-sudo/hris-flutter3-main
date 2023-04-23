import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  const AuthLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 250,
              width: Get.width,
              color: Colors.blue[100],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                SizedBox(height: 50),
                // Container(
                //   alignment: Alignment.center,
                //   height: 75,
                //   child: Image.asset(
                //     "assets/logo/pehadirlogo.png",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Text(
                  "HR SISTEM",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Email",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => TextField(
                    controller: controller.password,
                    keyboardType: TextInputType.text,
                    obscureText: controller.hide.value,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan Password",
                      suffixIcon: IconButton(
                        onPressed: () => controller.hide.toggle(),
                        icon: Icon(Icons.remove_red_eye,
                            color: controller.hide.isTrue
                                ? Colors.black45
                                : Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "Saya menyetujui ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("klik syarat");
                                },
                              text: "syarat",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: ", ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("klik ketentuan");
                                },
                              text: "ketentuan",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: " dan ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("klik privasi");
                                },
                              text: "privasi",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () =>
                      controller.animate.isFalse ? controller.login() : null,
                  child: Obx(
                    () => controller.animate.isTrue
                        ? Center(
                            child: Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            "MASUK",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[300],
                    fixedSize: Size(150, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
