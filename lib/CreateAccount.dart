import 'package:flutter/material.dart';
import 'login.dart';


String savedUsername = "";
String savedPassword = "";

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إنشاء حساب")),
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
                if (username.text.isNotEmpty &&
                    password.text.isNotEmpty) {
                  savedUsername = username.text;
                  savedPassword = password.text;

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                        (route) => false,
                  );
                }
              },
              child: const Text("إنشاء حساب"),
            ),
          ],
        ),
      ),
    );
  }
}