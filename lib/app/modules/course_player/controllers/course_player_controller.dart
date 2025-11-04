import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CoursePlayerController extends GetxController {
  late VideoPlayerController videoController;
  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initVideo();
  }

  Future<void> _initVideo() async {
    final args = Get.arguments ?? {};
    final videoUrl = args['videoUrl'] ?? '';
    final isLocal = args['isLocal'] ?? false;

    try {
      videoController = isLocal
          ? VideoPlayerController.asset(videoUrl)
          : VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      await videoController.initialize();
      isInitialized.value = true;
      videoController.play();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat video: $e');
    }
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
