import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.code, 'name': 'Programming'},
      {'icon': Icons.design_services, 'name': 'Design'},
      {'icon': Icons.language, 'name': 'Bahasa'},
      {'icon': Icons.business, 'name': 'Bisnis'},
      {'icon': Icons.health_and_safety, 'name': 'Kesehatan'},
      {'icon': Icons.music_note, 'name': 'Musik'},
    ];

    // Contoh data kursus dengan gambar lokal
    final List<Map<String, String>> enrolledCourses = [
      {
        'title': 'Belajar Flutter Dasar',
        'instructor': 'Andi Pratama',
        'image': 'images/flutter.png',
      },
      {
        'title': 'Desain UI/UX Modern',
        'instructor': 'Siti Amelia',
        'image': 'images/ui-ux.jpeg',
      },
      {
        'title': 'Bahasa Inggris Pemula',
        'instructor': 'Rizky Hadi',
        'image': 'images/inggris.jpeg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'E-Learn Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            tooltip: 'Profil Saya',
            onPressed: () => Get.toNamed(Routes.PROFILE),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome
            Obx(
              () => Text(
                'Welcome, ${c.username.value} 👋',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Cari kursus...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Grid kategori kursus
            const Text(
              "Kategori Kursus",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final cat = categories[index];
                return GestureDetector(
                  onTap: () => Get.snackbar(
                    "Kategori",
                    "Kamu memilih kategori ${cat['name']}",
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat['icon'], color: Colors.blueAccent, size: 30),
                        const SizedBox(height: 8),
                        Text(
                          cat['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            // Kursus yang sedang diikuti
            const Text(
              "Kursus yang Sedang Diikuti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: enrolledCourses.length,
                itemBuilder: (context, index) {
                  final course = enrolledCourses[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(
                      Routes.COURSE_DETAIL,
                      arguments: {
                        'title': course['title'],
                        'instructor': course['instructor'],
                        'image': course['image'],
                        'description':
                            'Kursus ${course['title']} ini akan membantu kamu memahami konsep dasar dan penerapannya secara praktis.',
                      },
                    ),
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar lokal
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              course['image']!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "by ${course['instructor']}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
