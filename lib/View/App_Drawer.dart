// View/App_Drawer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SettingsPage.dart';
import 'FavoriteAzkarPage.dart';
import 'AboutApp.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // دالة لبناء كل عنصر في الدراور
  Widget buildListTile(
      String txt,
      IconData icon,
      Color iconColor,
      VoidCallback onTapAction,
      ) {
    return ListTile(
      onTap: onTapAction,
      leading: Text(
        txt.tr, // تم تفعيل الترجمة هنا
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 89, bottom: 1),
      child: Drawer(
        width: MediaQuery.of(context).size.width / 2,
        child: Container(
          color: Colors.black87,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 75, bottom: 25),
                child: Text(
                  "حصن المسلم".tr, // تفعيل الترجمة
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // عنصر الأذكار
              buildListTile(
                "الأذكار",
                Icons.list_alt,
                Colors.red,
                    () {
                  Get.back(); // يغلق الدراور فقط
                },
              ),
              // عنصر الأذكار المفضلة
              buildListTile(
                "الأذكار المفضلة",
                Icons.star,
                Colors.red,
                    () {
                  Get.to(() => const FavoriteAzkarPage());
                },
              ),
              // عنصر الإعدادات
              buildListTile(
                "الإعدادات",
                Icons.settings,
                Colors.red,
                    () {
                  Get.to(() => const SettingsPage());
                },
              ),
              // عنصر عن البرنامج
              buildListTile(
                "عن البرنامج",
                Icons.info_outline,
                Colors.red,
                    () {
                  Get.to(() => AboutAppPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}