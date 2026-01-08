import 'package:flutter/material.dart';
import 'App_Drawer.dart';
import 'ShowAzkarPage.dart'; // صفحة عرض الذكر الكامل

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // قائمة الأذكار المختصرة التي تظهر في الهوم
  List<String> azkarList = [
    "دعاء لبس الثوب",
    "دعاء السجود",
    "دعاء الريح",
    "دعاء الغضب",
    "الذكر قبل الوضوء",
    "الذكر عند دخول المنزل",
    "الذكر عند الخروج من المنزل",
    "الذكر عند الفراغ من الوضوء",
    "الدعاء على العدو",
  ];

  // قائمة النصوص الكاملة لكل ذكر عند الضغط
  List<String> fullAzkarText = [
    "(الحمدلله الذي كساني هذا الثوب ورزقنيه من غير حول ولا قوة)",
    "(سبحان ربي الاعلى)",
    "(اللهم إني أسألك خيرها ,وأعوذ بك من شرها)",
    "(أعوذ بالله من الشيطان الرجيم)",
    "بسم الله",
    "بسم الله ولجنا وبسم الله خرجنا وعلى الله ربنا توكلنا, ثم ليسلم على اهله",
    "بسم الله توكلت على الله ولا حول ولا قوة الا بالله",
    "اشهد ان لا اله الا الله وحده لا شريك له وأشهد ان محمداً عبده ورسوله",
    "اللهم منزل الكتاب , سريع الحساب , اهزم الاحزاب , اللهم اهزمهم وزلزلهم",
  ];

  // قائمة النجوم لكل ذكر
  List<bool> favorites = [];

  final TextEditingController newAzkarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // إنشاء قائمة النجوم بنفس طول الأذكار
    favorites = List.generate(azkarList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حصن المسلم",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // إضافة ذكر جديد
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newAzkarController,
                    decoration: InputDecoration(
                      hintText: "أضف ذكر جديد",
                      filled: true,
                      fillColor: Colors.red[50],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                  ),
                  onPressed: () {
                    if (newAzkarController.text.isNotEmpty) {
                      setState(() {
                        azkarList.add(newAzkarController.text);
                        fullAzkarText.add(newAzkarController.text); // النص الكامل نفسه
                        favorites.add(false);
                        newAzkarController.clear();
                      });
                    }
                  },
                  child: const Text(
                    "إضافة",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // قائمة الأذكار
            Expanded(
              child: ListView.builder(
                itemCount: azkarList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red[100],
                    child: ListTile(
                      title: GestureDetector(
                        onTap: () {
                          // عند الضغط على النص، نفتح صفحة عرض الذكر الكامل
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowAzkarPage(
                                azkarText: fullAzkarText[index],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          azkarList[index], // يظهر فقط عنوان مختصر في الهوم
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      leading: IconButton(
                        icon: Icon(
                          favorites[index] ? Icons.star : Icons.star_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            favorites[index] = !favorites[index];
                          });
                        },
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              newAzkarController.text = azkarList[index];
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("تعديل الذكر"),
                                  content: TextField(
                                    controller: newAzkarController,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          azkarList[index] =
                                              newAzkarController.text;
                                          fullAzkarText[index] =
                                              newAzkarController.text; // تعديل النص الكامل
                                          newAzkarController.clear();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("تعديل"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                azkarList.removeAt(index);
                                fullAzkarText.removeAt(index); // حذف النص الكامل
                                favorites.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(),
    );
  }
}