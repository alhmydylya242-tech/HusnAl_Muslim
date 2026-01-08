import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. صورة الخلفية (تغطي كامل الشاشة)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/one.jpeg"),
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 2. النصوص (اسم التطبيق) محاذاته بالأعلى [التعديل هنا]
          Positioned(
            top: 80, // المسافة من أعلى الشاشة (يمكنك تقليلها أو زيادتها)
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "حِصْنُ المُسْلِمِ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.orange.withOpacity(0.6),
                  child: Text(
                    "مِنْ أَذْكاَرِ الكِتَابِ وَالسُّنَّةِ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // أيقونة التحميل تتبع النصوص لتكون في الجزء العلوي أيضاً
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                ),
              ],
            ),
          ),

          // 3. صورة الكتب تظل في أسفل الشاشة تماماً
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "images/two.jpeg",
              height: 150, // حجم الصورة في الأسفل
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}