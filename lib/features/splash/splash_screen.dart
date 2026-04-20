import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sabaa/gen/assets.gen.dart';

import '../../../../src/application/router/app_routes.dart';
import '../../../../src/infrastructure/storage/local_storage_service.dart';
import '../../../../src/logger/log_services/dev_logger.dart';


class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _navigated = false;

    return Lottie.asset(
      Assets.lottie.splash,
      repeat: false,
      fit: BoxFit.cover,
      frameRate: FrameRate.max,
      onLoaded: (composition) {
        if (_navigated) return;
        _navigated = true;

        Future.delayed(composition.duration + Duration(seconds: 2), () async {
          final storage = ref.read(localStorageServiceProvider);
          final isFirstTime = await storage.isFirstTimeOpen();
          final isAuth = await ref.read(isAuthenticatedProvider.future);

          Dev.logLine(' isAuth: $isAuth');

          // ===== First-time onboarding =====
          // if (isFirstTime) {
          //   context.goNamed(AppRoutes.onBoarding);
          //   return;
          // }

          // ===== Not authenticated =====
          if (!isAuth) {
            context.goNamed(AppRoutes.signInScreen);
            return;
          }


          // ===== Authenticated =====
          context.goNamed(AppRoutes.mainScreen);
        });
      },
    );
  }
}
