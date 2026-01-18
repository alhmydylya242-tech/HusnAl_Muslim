import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/AuthController.dart';
import 'CreateAccount.dart';
import 'home_page.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الدخول".tr),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "اسم المستخدم".tr,
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) => authController.setUsername(val),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "كلمة المرور".tr,
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) => authController.setPassword(val),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
              ),
              onPressed: () {
                if (authController.validate()) {
                  Get.offAll(() => HomePage());
                } else {
                  Get.snackbar(
                    "خطأ".tr,
                    "الرجاء ملء اسم المستخدم وكلمة المرور".tr,
                    backgroundColor: Colors.red[200],
                    colorText: Colors.black,
                  );
                }
              },
              child: Text(
                "تسجيل الدخول".tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => CreateAccount());
              },
              child: Text("إنشاء حساب جديد".tr),
            ),
          ],
        ),
      ),
    );
  }
}