import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/AzkarController.dart';
import 'ShowAzkarPage.dart';
import 'App_Drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AzkarController controller = Get.put(AzkarController());
  final TextEditingController newAzkarController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حصن المسلم".tr),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // فتح Dialog للبحث
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("بحث عن ذكر".tr),
                content: TextField(
                  controller: searchController,
                  decoration: InputDecoration(hintText: "أدخل نص للبحث".tr),
                  onChanged: (value) {
                    controller.filterAzkar(value);
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      searchController.clear();
                      controller.filterAzkar(""); // إعادة كل الأذكار
                      Get.back();
                    },
                    child: Text("إغلاق".tr),
                  ),
                ],
              ),
            );
          },
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
                      hintText: "أضف ذكر جديد".tr,
                      filled: true,
                      fillColor: Colors.red[50],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
                  onPressed: () {
                    if (newAzkarController.text.isNotEmpty) {
                      controller.addAzkar(
                          newAzkarController.text,
                          newAzkarController.text
                      );
                      newAzkarController.clear();
                    }
                  },
                  child: Text("إضافة".tr, style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // قائمة الأذكار
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.filteredAzkarList.length,
                itemBuilder: (context, index) {
                  final actualIndex = controller.filteredIndices[index];
                  return Card(
                    color: Colors.red[100],
                    child: ListTile(
                      title: GestureDetector(
                        onTap: () => Get.to(() => ShowAzkarPage(index: actualIndex)),
                        child: Text(
                          controller.azkarList[actualIndex],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                      leading: Obx(() => IconButton(
                        icon: Icon(
                          controller.favorites[actualIndex]
                              ? Icons.star
                              : Icons.star_border,
                          color: controller.favorites[actualIndex]
                              ? Colors.yellow
                              : Colors.white,
                        ),
                        onPressed: () {
                          controller.toggleFavorite(actualIndex);
                        },
                      )),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              newAzkarController.text = controller.azkarList[actualIndex];
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("تعديل الذكر".tr),
                                  content: TextField(controller: newAzkarController),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.editAzkar(
                                            actualIndex,
                                            newAzkarController.text,
                                            newAzkarController.text
                                        );
                                        newAzkarController.clear();
                                        Get.back();
                                      },
                                      child: Text("تعديل".tr),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () => controller.deleteAzkar(actualIndex),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(),
    );
  }
}