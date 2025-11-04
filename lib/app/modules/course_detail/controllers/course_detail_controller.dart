import 'package:get/get.dart';

class CourseDetailController extends GetxController {
  var courseTitle = ''.obs;
  var instructor = ''.obs;
  var description = ''.obs;
  var imagePath = ''.obs;

  var modules = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null) {
      courseTitle.value = args['title'] ?? '';
      instructor.value = args['instructor'] ?? '';
      description.value = args['description'] ?? '';
      imagePath.value = args['image'] ?? '';
    }

    modules.value = [
      {
        'title': 'Pengenalan Course',
        'videoUrl':
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      },
      {
        'title': 'Praktek Course',
        'videoUrl':
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      },
      {
        'title': 'Project Besar Course',
        'videoUrl':
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      },
    ];
  }
}
