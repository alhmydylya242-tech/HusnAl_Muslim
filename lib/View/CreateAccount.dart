import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/AuthController.dart';
import 'Login.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إنشاء حساب".tr), // تفعيل الترجمة
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "اسم المستخدم".tr, // تفعيل الترجمة
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) => authController.setUsername(val),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "كلمة المرور".tr, // تفعيل الترجمة
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
                  Get.offAll(() => Login());
                } else {
                  Get.snackbar(
                    "خطأ".tr, // تفعيل الترجمة
                    "الرجاء ملء اسم المستخدم وكلمة المرور".tr, // تفعيل الترجمة
                    backgroundColor: Colors.red[200],
                    colorText: Colors.black,
                  );
                }
              },
              child: Text("إنشاء حساب".tr, style: const TextStyle(color: Colors.white)), // تفعيل الترجمة
            ),
          ],
        ),
      ),
    );
  }
}