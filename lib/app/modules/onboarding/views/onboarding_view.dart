import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final pageController = PageController();

    final List<Map<String, String>> pages = [
      {
        'title': 'Selamat Datang di E-Learn',
        'subtitle': 'Belajar kapan saja dan di mana saja dengan mudah.',
        'image': 'images/learn1.jpg',
      },
      {
        'title': 'Banyak Pilihan Kursus',
        'subtitle': 'Pilih dari berbagai kategori kursus favoritmu.',
        'image': 'images/learn2.jpg',
      },
      {
        'title': 'Ayo Mulai Belajar!',
        'subtitle': 'Kembangkan skill kamu sekarang juga.',
        'image': 'images/learn3.jpg',
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: controller.changePage,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final data = pages[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(data['image']!, fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.5)),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          data['subtitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Dots Indicator
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: controller.pageIndex.value == index ? 12 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: controller.pageIndex.value == index
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Button "Mulai Belajar"
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Get.offNamed(Routes.HOME),
              child: const Text(
                "Mulai Belajar",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
