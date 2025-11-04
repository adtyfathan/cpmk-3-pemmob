import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/course_player_controller.dart';

class CoursePlayerView extends GetView<CoursePlayerController> {
  const CoursePlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CoursePlayerController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Course Player',
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
            // === Video Player Area ===
            Obx(() {
              if (!c.isInitialized.value) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.blueAccent),
                  ),
                );
              }
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: c.videoController.value.aspectRatio,
                  child: VideoPlayer(c.videoController),
                ),
              );
            }),

            const SizedBox(height: 20),

            // === Judul Materi ===
            const Text(
              "Flutter untuk Pemula",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // === Deskripsi Materi ===
            const Text(
              "Pelajari dasar-dasar Flutter untuk membangun aplikasi mobile modern. "
              "Materi ini mencakup pengenalan widget, struktur project, dan cara membuat tampilan interaktif sederhana.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            // === Materi Berikutnya ===
            const Text(
              "Materi Berikutnya",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Dummy Next Lesson
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.play_circle_outline,
                  color: Colors.blueAccent,
                  size: 35,
                ),
                title: const Text(
                  "Praktek Course Flutter",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: const Text(
                  "Implementasikan hasil pembelajaran dengan membuat project mini Flutter.",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {
                  Get.snackbar(
                    "Materi Berikutnya",
                    "Menuju ke Praktek Course Flutter",
                  );
                },
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),

      // === Floating Play/Pause Button ===
      floatingActionButton: Obx(() {
        if (!c.isInitialized.value) return const SizedBox();
        return FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            c.videoController.value.isPlaying
                ? c.videoController.pause()
                : c.videoController.play();
          },
          child: Icon(
            c.videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        );
      }),
    );
  }
}
