import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sabaa/features/auth/signIn/presentation/screens/sign_in_screen.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/customers/presentation/screens/create_customer_page.dart';
import 'package:sabaa/features/customers/presentation/screens/create_customer_success_page.dart';
import 'package:sabaa/features/customers/presentation/screens/customer_details_page.dart';
import 'package:sabaa/features/home/presentation/screens/home_screen.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/new_order/presentation/screens/new_order_page.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/presentation/pages/order_summary_page.dart';
import 'package:sabaa/features/order/presentation/screens/payment_success_page.dart';
import 'package:sabaa/features/splash/splash_screen.dart';

import 'app_routes.dart';
import 'custom_navigation_observer.dart';
import 'fallback_screen.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter goRouter;

  AppRouter(Ref ref) : goRouter = _createRouter(ref);

  static GoRouter _createRouter(Ref ref) {
    String initialRoute = AppRoutes.splashScreen;
    return GoRouter(
        navigatorKey: rootKey,
        initialLocation: initialRoute,
        observers: [CustomNavigationObserver()],
        errorBuilder: (context, state) => const FallbackScreen(),

        //   redirect: (context, state) async {
        //     // Consumer(
        //     //   builder: (context, ref, child) {
        //     //     // return ;
        //     //   },
        //     // );
        //   //  final storage = ref.read(localStorageServiceProvider);
        //   //   final isFirstTime = await storage.isFirstTimeOpen();
        //   //   final isAuth = await ref.read(isAuthenticatedProvider.future);
        //   //   final currentLocation = state.matchedLocation;

        //   //   Dev.logLine('Current location: $currentLocation');
        //   //   Dev.logLine('isFirstTime: $isFirstTime, isAuth: $isAuth');

        //   //   // ===== First-time onboarding =====
        //   //   if (isFirstTime ) {
        //   //     Dev.logLine(AppRoutes.onBoarding);
        //   //     return AppRoutes.onBoarding;
        //   //   }

        //   //   // ===== Not authenticated =====
        //   //   if (!isAuth ) {
        //   //     Dev.logLine(AppRoutes.signInScreen);

        //   //     return AppRoutes.signInScreen;
        //   //   }

        //   //   // ===== Authenticated users trying to access non-home pages =====
        //   //   // if (isAuth) {
        //   //     return AppRoutes.homeScreen;
        //     // }

        //     // No redirection needed
        //     // return null;
        // },
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.splashScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: SplashScreen(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.signInScreen,
            name: AppRoutes.signInScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: SignInScreen(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.mainScreen,
            name: AppRoutes.mainScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: MainScreen(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.homeScreen,
            name: AppRoutes.homeScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: HomeScreen(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.customerDetailsScreen,
            name: AppRoutes.customerDetailsScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: CustomerDetailsPage(
                  customer: state.extra as Customer,
                ),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.newOrderScreen,
            name: AppRoutes.newOrderScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: NewOrderPage(
                  customerName: state.extra as String,
                ),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.addCustomerScreen,
            name: AppRoutes.addCustomerScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: CreateCustomerPage(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.createCustomerSuccessScreen,
            name: AppRoutes.createCustomerSuccessScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: CreateCustomerSuccessPage(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.orderSummaryScreen,
            name: AppRoutes.orderSummaryScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: OrderSummaryPage(
                  customerId: state.extra as String,
                ),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: AppRoutes.paymentSuccessScreen,
            name: AppRoutes.paymentSuccessScreen,
            parentNavigatorKey: rootKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: PaymentSuccessPage(
                  paymentResponse: state.extra as CreatePaymentResponse,
                ),
                key: state.pageKey,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
        ]);
  }
}
