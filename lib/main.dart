import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sabaa/src/application/di/app_initilaizer.dart';

import 'features/app/myApp.dart';

Future<void> main() async {
  await AppInitializer.init();


  final container = await initializeProviders();
  await handleSplashScreen(container); 

  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        // enabled: false,
        builder: (context) {
          return UncontrolledProviderScope( 
            container: container,
            child: EasyLocalization(
              supportedLocales: const [Locale('en'), Locale('ar')],
              path: 'assets/translations',
              child: const MyApp(),
            ),
          );
        }),
  );
}
 