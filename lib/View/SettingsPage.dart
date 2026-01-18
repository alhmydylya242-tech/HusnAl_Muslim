// View/SettingsPage.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/AzkarController.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AzkarController controller = Get.find<AzkarController>();

    // الإعدادات المحلية الأخرى
    RxBool autoCityUpdate = false.obs;
    RxBool dstEnabled = false.obs;
    RxBool autoNextZikr = true.obs;
    RxBool vibrationEnabled = true.obs;
    RxBool soundEnabled = true.obs;

    return Scaffold(
      backgroundColor: const Color(0xFFDDCCAC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6D1B1B),
        title: Text(
          "الإعدادات".tr,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // إعدادات المدينة
          _buildSettingsGroup(
            title: "إعدادات المدينة".tr,
            children: [
              _buildLocationRow(),
              Divider(color: Colors.black),
              Obx(() => _buildSwitchRow(
                  "تحديث المدينة تلقائياً".tr,
                  autoCityUpdate.value,
                      (val) => autoCityUpdate.value = val)),
              Divider(color: Colors.black),
              Obx(() => _buildSwitchRow(
                  "تفعيل التوقيت الصيفي".tr,
                  dstEnabled.value,
                      (val) => dstEnabled.value = val)),
            ],
          ),

          // إعدادات الخط
          _buildSettingsGroup(
            title: "إعدادات الخط".tr,
            children: [
              // معاينة النص
              Obx(() => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: controller.fontSize.value,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )),
              Obx(() => _buildSliderRow(
                  "حجم الخط".tr,
                  controller.fontSize.value,
                  10,
                  40,
                      (val) => controller.setFontSize(val))),
              Divider(color: Colors.black),
              Obx(() => _buildDropdownRow(
                  "نوع الخط للأذكار".tr,
                  controller.fontType.value,
                  ["الخط ١".tr, "الخط ٢".tr, "الخط ٣".tr],
                      (val) => controller.setFontType(val!))),
              Divider(color: Colors.black),
              Obx(() => _buildSwitchRow(
                  "تشكيل الحروف".tr,
                  controller.showTashkeel.value,
                      (val) => controller.setShowTashkeel(val))),
            ],
          ),

          // إعدادات السبحة
          _buildSettingsGroup(
            title: "إعدادات السبحة".tr,
            children: [
              Obx(() => _buildSwitchRow(
                  "الانتقال للذكر التالي بعد انتهاء العد".tr,
                  autoNextZikr.value,
                      (val) => autoNextZikr.value = val)),
              Divider(color: Colors.black),
              Obx(() => _buildSwitchRow(
                  "الاهتزاز عند الانتقال للذكر التالي".tr,
                  vibrationEnabled.value,
                      (val) => vibrationEnabled.value = val)),
              Divider(color: Colors.black),
              Obx(() => _buildSwitchRow(
                  "تشغيل صوت عند استخدام السبحة".tr,
                  soundEnabled.value,
                      (val) => soundEnabled.value = val)),
            ],
          ),
        ],
      ),
    );
  }

  // -------------------- Widgets مساعدة --------------------

  Widget _buildSettingsGroup(
      {required String title, required List<Widget> children}) {
    return Card(
      color: const Color(0xFFEFEBE9),
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: const Color(0xFF6D1B1B),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSwitchRow(String label, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(label, textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF6D1B1B))),
      leading: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF00897B),
      ),
    );
  }

  Widget _buildLocationRow() {
    return ListTile(
      title: Text("المدينة الحالية".tr, textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF6D1B1B))),
      leading: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        child: Text("تغيير...".tr),
      ),
      subtitle: Text("غير معروفة".tr, textAlign: TextAlign.right),
    );
  }

  Widget _buildSliderRow(String label, double value, double min, double max,
      Function(double) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
              activeColor: const Color(0xFF00897B),
            ),
          ),
          Text(label.tr, style: const TextStyle(color: Color(0xFF6D1B1B))),
        ],
      ),
    );
  }

  Widget _buildDropdownRow(
      String label, String value, List<String> items, Function(String?) onChanged) {
    return ListTile(
      title: Text(label.tr, textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF6D1B1B))),
      leading: DropdownButton<String>(
        value: value,
        items: items
            .map((String item) => DropdownMenuItem<String>(
            value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}