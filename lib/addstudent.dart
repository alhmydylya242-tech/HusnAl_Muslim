import 'package:flutter/material.dart';
import 'ShowAzkarPage.dart'; // استدعاء صفحة عرض الذكر

class AddAzkar extends StatefulWidget {
  const AddAzkar({super.key});

  @override
  State<AddAzkar> createState() => _AddAzkarState();
}

class _AddAzkarState extends State<AddAzkar> {
  List<String> azkarList = ["سبحان الله", "الحمد لله", "الله أكبر"];
  Color c = Colors.amber[100]!;
  TextEditingController azkarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة ذكر")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              controller: azkarController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: c,
                labelText: "أضف ذكر جديد",
                hintText: "أدخل الذكر",
                prefixIcon: const Icon(Icons.edit_note),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(c)),
                onPressed: () {
                  if (!azkarList.contains(azkarController.text) &&
                      azkarController.text.isNotEmpty) {
                    setState(() {
                      azkarList.add(azkarController.text);
                      azkarController.clear();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("خطأ: ذكر مكرر أو فارغ")),
                    );
                  }
                },
                child: const Text("أضف ذكر"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: azkarList.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  title: Text(
                    azkarList[i],
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text("هل تريد الحذف النهائي؟"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  azkarList.removeAt(i);
                                });
                                Navigator.pop(context);
                              },
                              child: const Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon:
                    const Icon(Icons.delete_forever, color: Colors.red),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      azkarController.text = azkarList[i];
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("تعديل الذكر"),
                          content: TextField(
                            controller: azkarController,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  azkarList[i] = azkarController.text;
                                  azkarController.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: const Text("تعديل"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit, color: Colors.blue),
                  ),
                  onTap: () {
                    // عند الضغط على أي ذكر، نفتح صفحة عرض الذكر كامل
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowAzkarPage(azkarText: azkarList[i]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}