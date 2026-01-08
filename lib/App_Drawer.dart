import 'package:flutter/material.dart';
import 'SettingsPage.dart'; // تأكد من استدعاء صفحة الإعدادات

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
//0xFFDDCCAC
  //(0xFFEFEBE9)
  Widget buildListTile(
      BuildContext context,
      String txt,
      IconData icon,
      Color iconColor,
      ) {
    return ListTile(
      onTap: () {
        if (txt == "الإعدادات") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        } else {
          Navigator.pop(context); // أي خيار آخر فقط يغلق الـ Drawer
        }
      },
      leading: Text(
        txt,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 2),
        ],
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
                child: const Text(
                  "حصن المسلم",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buildListTile(context, "الأذكار", Icons.list_alt, Colors.red),
              buildListTile(context, "الأذكار المفضلة", Icons.star, Colors.red),
              buildListTile(context, "الإعدادات", Icons.settings, Colors.red),
              buildListTile(context, "عن البرنامج", Icons.info_outline, Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}