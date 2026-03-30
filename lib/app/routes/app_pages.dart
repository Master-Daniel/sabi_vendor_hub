import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/shop_setup/bindings/shop_setup_begin_binding.dart';
import '../modules/shop_setup/bindings/shop_setup_profile_details_binding.dart';
import '../modules/shop_setup/views/shop_setup_begin_view.dart';
import '../modules/shop_setup/views/shop_setup_profile_details_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_SETUP_BEGIN,
      page: () => const ShopSetupBeginView(),
      binding: ShopSetupBeginBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_SETUP_PROFILE_DETAILS,
      page: () => const ShopSetupProfileDetailsView(),
      binding: ShopSetupProfileDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
