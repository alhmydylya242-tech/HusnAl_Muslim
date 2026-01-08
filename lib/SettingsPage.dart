import 'package:flutter/material.dart';
//import 'dart:io';
//import 'package:image_picker/image_picker.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();


}

class _SettingsPageState extends State<SettingsPage> {

  bool _autoCityUpdate = false;
  bool _dstEnabled = false;
  double _fontSize = 18.0;
  String _fontType = 'الخط ١';
  bool _showTashkeel = true;
  bool _autoNextZikr = true;
  bool _vibrationEnabled = true;
  bool _soundEnabled = true;
 // File? _profileImage;

  //final ImagePicker _picker = ImagePicker();

  /*Future<void> _pickImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDCCAC), // خلفية عامة بيج/بني فاتح أغمق
      appBar: AppBar(
        backgroundColor: const Color(0xFF6D1B1B),
        title: const Text(
          "الإعدادات",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false, // النص على اليمين
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white), // سهم متجه لليمين
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // إعدادات المدينة
          _buildSettingsGroup(
            title: "إعدادات المدينة",
            children: [
              _buildLocationRow(), Divider(color: Colors.black),
              _buildSwitchRow("تحديث المدينة تلقائياً", _autoCityUpdate, (val) {
                setState(() => _autoCityUpdate = val);
              }), Divider(color: Colors.black),
              _buildSwitchRow("تفعيل التوقيت الصيفي", _dstEnabled, (val) {
                setState(() => _dstEnabled = val);
              }),
            ],
          ),

          // إعدادات الخطوط
          _buildSettingsGroup(
            title: "إعدادات الخطوط",
            children: [
              // معاينة النص "بسم الله..."
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.5), // خلفية سوداء شفافة
                child: Text(
                  "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // النص أبيض
                  ),
                ),
              ),


              _buildSliderRow("حجم الخط", _fontSize, 10, 40, (val) {
                setState(() => _fontSize = val);
              }),
              Divider(color: Colors.black),

              _buildDropdownRow(
                  "نوع الخط للأذكار", _fontType, ["الخط ١", "الخط ٢", "الخط ٣"], (val) {
                setState(() => _fontType = val!);
              }),
              Divider(color: Colors.black),

              _buildSwitchRow("تشكيل الحروف", _showTashkeel, (val) {
                setState(() => _showTashkeel = val);
              }),
            ],
          ),

          // إعدادات السبحة
          _buildSettingsGroup(
            title: "إعدادات السبحة",
            children: [
              _buildSwitchRow("الإنتقال للذكر التالي بعد إنتهاء العد", _autoNextZikr, (val) {
                setState(() => _autoNextZikr = val);
              }),
              Divider(color: Colors.black),
              _buildSwitchRow("الاهتزاز عند الانتقال للذكر التالي", _vibrationEnabled, (val) {
                setState(() => _vibrationEnabled = val);
              }), Divider(color: Colors.black),
              _buildSwitchRow("تشغيل صوت عند استخدام السبحة", _soundEnabled, (val) {
                setState(() => _soundEnabled = val);
              }),
            ],
          ),
/*
          _buildSettingsGroup(
            title: "الصورة الشخصية",
            children: [
              const SizedBox(height: 15),

              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage:
                  _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? const Icon(Icons.person, size: 40, color: Colors.grey)
                      : null,
                ),
              ),

              TextButton(
                onPressed: _pickImage,
                child: const Text(
                  "اختيار صورة من المعرض",
                  style: TextStyle(color: Color(0xFF6D1B1B)),
                ),
              ),
            ],
          ),
*/
        ],
      ),
    );
  }

  // Card لكل مجموعة إعدادات مع لون خلفية أفتح من الخلفية العامة
  Widget _buildSettingsGroup({required String title, required List<Widget> children}) {
    return Card(
      color: const Color(0xFFEFEBE9), // لون أفتح من الخلفية العامة
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: const Color(0xFF6D1B1B), // عنوان العنابي
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      title: const Text("المدينة الحالية", textAlign: TextAlign.right, style: TextStyle(color: Color(0xFF6D1B1B))),
      leading: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
        ),
        child: const Text("تغيير..."),
      ),
      subtitle: const Text("غير معروفة", textAlign: TextAlign.right),
    );
  }

  Widget _buildSliderRow(String label, double value, double min, double max, Function(double) onChanged) {
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
          Text(label, style: const TextStyle(color: Color(0xFF6D1B1B))),
        ],
      ),
    );
  }

  Widget _buildDropdownRow(String label, String value, List<String> items, Function(String?) onChanged) {
    return ListTile(
      title: Text(label, textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF6D1B1B))),
      leading: DropdownButton<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}