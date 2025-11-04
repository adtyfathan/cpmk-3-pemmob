import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CourseDetailController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detail Kursus',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course image/video preview
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  c.imagePath.value,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Title and instructor
            Obx(
              () => Text(
                c.courseTitle.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                'Instruktur: ${c.instructor.value}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 16),

            // Description
            Obx(
              () => Text(
                c.description.value,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Daftar Modul',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

           // List of modules
            Obx(
              () => Column(
                children: c.modules.map((module) {
                  return Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.blueAccent,
                      ),
                      title: Text(module['title'] ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigasi ke Course Player
                        Get.toNamed(
                          '/course-player',
                          arguments: {
                            'title': module['title'],
                            'videoUrl': module['videoUrl'],
                            'isLocal': false,
                          },
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
