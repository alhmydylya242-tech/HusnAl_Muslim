import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/AzkarController.dart';

class ShowAzkarPage extends StatelessWidget {
  final int index; // نأخذ رقم العنصر
  ShowAzkarPage({super.key, required this.index});

  final AzkarController controller = Get.find<AzkarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الذكر الكامل".tr), // تفعيل الترجمة هنا
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Obx(() => Text(
            controller.fullAzkarText[index],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}