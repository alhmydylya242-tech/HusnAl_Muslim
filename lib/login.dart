import 'package:flutter/material.dart';
import 'CreateAccount.dart';
import 'home_page.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تسجيل الدخول")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: username,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "اسم المستخدم",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "كلمة المرور",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (username.text == savedUsername &&
                    password.text == savedPassword) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("بيانات الدخول خاطئة")),
                  );
                }
              },
              child: const Text("تسجيل الدخول"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                );
              },
              child: const Text("إنشاء حساب جديد"),
            ),
          ],
        ),
      ),
    );
  }
}