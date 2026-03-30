import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';

/// Full-screen splash background + centered logo.
class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [
        _BaseGradient(),
        _FaintColorWash(),
        _FaintGrid(),
        _SoftVignette(),
        _BottomRightBlurWash(),
        _CenteredLogo(),
      ],
    );
  }
}

class _CenteredLogo extends StatelessWidget {
  const _CenteredLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.45,
        child: Image.asset(
          AppImages.sabiLogo,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}

/// Full-screen gradient anchored on brand color `#1E1226`.
class _BaseGradient extends StatelessWidget {
  const _BaseGradient();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.splashGradientStart,
            AppColors.splashGradientStart.withValues(alpha: 0.92),
            AppColors.splashGradientEnd,
          ],
          stops: const [0.0, 0.45, 1.0],
        ),
      ),
    );
  }
}

/// Light color wash — kept subtle so the grid stays visible.
class _FaintColorWash extends StatelessWidget {
  const _FaintColorWash();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: 0.0),
              Colors.white.withValues(alpha: 0.04),
              AppColors.splashGradientEnd.withValues(alpha: 0.15),
            ],
            stops: const [0.0, 0.55, 1.0],
          ),
        ),
      ),
    );
  }
}

class _FaintGrid extends StatelessWidget {
  const _FaintGrid();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _GridPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..strokeWidth = 0.5;

    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SoftVignette extends StatelessWidget {
  const _SoftVignette();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.05,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.22),
            ],
            stops: const [0.45, 1.0],
          ),
        ),
      ),
    );
  }
}

class _BottomRightBlurWash extends StatelessWidget {
  const _BottomRightBlurWash();

  static const double _blurSigma = 14;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // Near full-bleed so blur can reach the lower part of the centered logo.
    final w = size.width * 0.98;
    final h = size.height * 0.98;
    return IgnorePointer(
      child: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: w,
          height: h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    // Slightly inset from corner so the ellipse reaches further
                    // toward center / logo.
                    center: const Alignment(0.92, 0.94),
                    radius: 1.45,
                    colors: const [
                      Colors.white,
                      Colors.white,
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.62, 1.0],
                  ).createShader(bounds);
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _blurSigma,
                    sigmaY: _blurSigma,
                  ),
                  child: const ColoredBox(color: Colors.transparent),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.92, 0.94),
                    radius: 1.45,
                    colors: [
                      AppColors.splashBlurTint,
                      AppColors.splashBlurTint.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

