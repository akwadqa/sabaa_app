import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/src/application/router/routing/app_router_provider.dart';
import 'package:toastification/toastification.dart';
import '../../src/core/localization/current_language.dart';
import '../../src/core/utils/theme/app_theme.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    Future(() => ref
        .read(currentLanguageProvider.notifier)
        .changeLanguage(context, context.locale.languageCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);
    final currentLanguage = ref.watch(currentLanguageProvider);
    return ToastificationWrapper(
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          // routerDelegate: appRouter.delegate(
          //     deepLinkBuilder: (deepLink) => DeepLink.defaultPath),
          routerConfig: appRouter.goRouter,
          builder: BotToastInit(),
          
          theme: ref.watch(appThemeProvider),
          onGenerateTitle: (context) => context.tr('appTitle'),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          // supportedLocales: [Locale('en')],
          locale: Locale(currentLanguage),
          // locale: Locale('en'),
        ),
    );
   
  }
}
