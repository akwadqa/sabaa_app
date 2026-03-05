import 'package:flutter/cupertino.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      width: 50,
      height: 50,
      Assets.lottie.icLoadingWhite,
      // Assets.lottie.processingCircle,
      repeat: true,
      
      // fit: BoxFit.cover,
      // frameRate: FrameRate.max,
    ));
  }
}
