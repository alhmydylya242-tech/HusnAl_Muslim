import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'View/Splashscreen.dart';
import 'AppTranslation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslation(),        // ربط الترجمات
      locale: const Locale('ar'),            // اللغة الافتراضية
      fallbackLocale: const Locale('en'),    // إذا النص غير موجود بالعربية
      debugShowCheckedModeBanner: false,
      title: 'حصن المسلم',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Tajawal',
      ),
      home: Splashscreen(),
    );
  }
}