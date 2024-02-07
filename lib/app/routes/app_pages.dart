import 'package:get/get.dart';

import '../modules/Etalase/bindings/etalase_binding.dart';
import '../modules/Etalase/views/etalase_view.dart';
import '../modules/Intro/bindings/intro_binding.dart';
import '../modules/Intro/views/intro_view.dart';
import '../modules/LandingPage/bindings/landing_page_binding.dart';
import '../modules/LandingPage/views/landing_page_view.dart';
import '../modules/LandingPage2/bindings/landing_page2_binding.dart';
import '../modules/LandingPage2/views/landing_page2_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => SplashScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => LandingPage(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE2,
      page: () => LandingPage2(),
      binding: LandingPage2Binding(),
    ),
    GetPage(
      name: _Paths.ETALASE,
      page: () => const EtalaseView(),
      binding: EtalaseBinding(),
    ),
  ];
}
