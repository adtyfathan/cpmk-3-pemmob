import 'package:get/get.dart';
import 'app_routes.dart';

import '../app/modules/onboarding/views/onboarding_view.dart';
import '../app/modules/onboarding/bindings/onboarding_binding.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/course_detail/views/course_detail_view.dart';
import '../app/modules/course_detail/bindings/course_detail_binding.dart';
import '../app/modules/course_player/views/course_player_view.dart';
import '../app/modules/course_player/bindings/course_player_binding.dart';
import '../app/modules/profile/views/profile_view.dart';
import '../app/modules/profile/bindings/profile_binding.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.ONBOARDING, page: () => OnboardingView(), binding: OnboardingBinding()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.COURSE_DETAIL, page: () => CourseDetailView(), binding: CourseDetailBinding()),
    GetPage(name: Routes.COURSE_PLAYER, page: () => CoursePlayerView(), binding: CoursePlayerBinding()),
    GetPage(name: Routes.PROFILE, page: () => ProfileView(), binding: ProfileBinding()),
  ];
}
