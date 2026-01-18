// View/Splashscreen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

class SplashController extends GetxController {
  // مدة الانتقال بالثواني
  final int duration = 3;

  @override
  void onInit() {
    super.onInit();
    // الانتقال بعد المدة المحددة
    Future.delayed(Duration(seconds: duration), () {
      Get.offAll(() => Login());
    });
  }
}

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية مع تدرج لوني احترافي
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red.shade900, Colors.orange.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // نصوص وشعار التطبيق
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // النص الرئيسي
                Text(
                  "حِصْنُ المُسْلِمِ".tr, // تفعيل الترجمة
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                // النص الفرعي
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "مِنْ أَذْكاَرِ الكِتَابِ وَالسُّنَّةِ".tr, // تفعيل الترجمة
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                // مؤشر التحميل متحرك بشكل دائري
                const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // صورة الكتب أسفل الشاشة
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              "images/two.jpeg",
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}