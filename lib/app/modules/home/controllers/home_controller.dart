import 'package:get/get.dart';

class HomeController extends GetxController {
  var username = 'Aditya'.obs;

  var courses = [
    {
      'title': 'Belajar Flutter Dasar',
      'instructor': 'Aditya Fathan',
      'image': 'assets/images/flutter.png',
    },
    {
      'title': 'UI/UX Design untuk Pemula',
      'instructor': 'Rina Andika',
      'image': 'assets/images/uiux.png',
    },
    {
      'title': 'Data Science dengan Python',
      'instructor': 'Budi Santoso',
      'image': 'assets/images/datascience.png',
    },
  ].obs;
}
