import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sabi_vendor_hub_mobile/app/modules/auth/login/bindings/login_binding.dart';
import 'package:sabi_vendor_hub_mobile/app/modules/auth/login/views/login_view.dart';
import 'package:sabi_vendor_hub_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:sabi_vendor_hub_mobile/app/modules/home/views/home_view.dart';
import 'package:sabi_vendor_hub_mobile/app/services/api/api_service.dart';

import '../../../constants/colors.dart';
import '../controllers/splash_controller.dart';
import '../widgets/splash_screen_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  static const Duration _navDelay = Duration(seconds: 10);

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SplashScreenUi.overlay);
    _scheduleNavigation();
  }

  Future<void> _scheduleNavigation() async {
    await Future<void>.delayed(_navDelay);
    if (!mounted) return;

    var authenticated = false;
    try {
      authenticated = await ApiService()
          .hasSession()
          .timeout(const Duration(seconds: 5), onTimeout: () => false);
    } catch (_) {
      authenticated = false;
    }
    if (!mounted) return;

    SplashScreenUi.applyPostSplashOverlay();

    if (authenticated) {
      HomeBinding().dependencies();
    } else {
      LoginBinding().dependencies();
    }
    if (!mounted) return;

    final route = MaterialPageRoute<void>(
      builder: (_) =>
          authenticated ? const HomeView() : const LoginView(),
      settings: RouteSettings(
        name: authenticated ? '/home' : '/login',
      ),
    );

    await Navigator.of(context).pushAndRemoveUntil(route, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SplashScreenUi.overlay,
      child: Scaffold(
        backgroundColor: AppColors.splashGradientStart,
        extendBodyBehindAppBar: true,
        body: const SplashScreenBody(),
      ),
    );
  }
}