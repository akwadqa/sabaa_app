import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sabaa/features/auth/signIn/presentation/screens/sign_in_screen.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/domain/model/customer_model.dart';
import 'package:sabaa/features/customers/presentation/screens/create_customer_page.dart';
import 'package:sabaa/features/customers/presentation/screens/create_customer_success_page.dart';
import 'package:sabaa/features/customers/presentation/screens/customer_details_page.dart';
import 'package:sabaa/features/home/presentation/screens/home_screen.dart';
import 'package:sabaa/features/main/presentation/screens/main_screen.dart';
import 'package:sabaa/features/new_order/presentation/screens/invoice_review_page.dart';
import 'package:sabaa/features/new_order/presentation/screens/invoice_summary_page.dart';
import 'package:sabaa/features/new_order/presentation/screens/new_order_page.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/presentation/pages/display_capture_page.dart';
import 'package:sabaa/features/order/presentation/pages/order_summary_page.dart';
import 'package:sabaa/features/order/presentation/pages/success_payment_screen.dart';
import 'package:sabaa/features/order/presentation/pages/unified_invoice_review_page.dart';
import 'package:sabaa/features/splash/splash_screen.dart';

import '../../../features/barcode_scanner/presentation/screen/barcode_scanner_page.dart';
import '../../../features/return_invoice/presentation/screens/return_invoice_review_page.dart';
import '../../../features/return_invoice/presentation/screens/return_items_page.dart';
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
                customer: state.extra as CustomerModel,
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
          path: AppRoutes.returnInvoiceScreen,
          name: AppRoutes.returnInvoiceScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final extra = state.extra as Map<String, dynamic>;

            return CustomTransitionPage(
              child: ReturnItemsPage(
                customer: extra['customer'] as CustomerModel,
                invoiceId: extra['invoiceId'] as String,
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
          path: AppRoutes.returnInvoiceReviewScreen,
          name: AppRoutes.returnInvoiceReviewScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final extra = state.extra as Map<String, dynamic>?;

            return CustomTransitionPage(
              child: ReturnInvoiceReviewPage(
                isReturn: extra?['isReturn'] as bool,
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
          path: AppRoutes.invoiceSummaryPage,
          name: AppRoutes.invoiceSummaryPage,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: InvoiceSummaryPage(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.invoiceReviewPage,
          name: AppRoutes.invoiceReviewPage,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: InvoiceReviewPage(),
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
          path: AppRoutes.paymentSuccessPage,
          name: AppRoutes.paymentSuccessPage,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: PaymentSuccessPage(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        ),
        // GoRoute(
        //   path: AppRoutes.orderSummaryScreen,
        //   name: AppRoutes.orderSummaryScreen,
        //   parentNavigatorKey: rootKey,
        //   pageBuilder: (BuildContext context, GoRouterState state) {
        //     return CustomTransitionPage(
        //       child: OrderSummaryPage(
        //         customer: state.extra as CustomerModel,
        //       ),
        //       key: state.pageKey,
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(opacity: animation, child: child);
        //       },
        //     );
        //   },
        // ),
        GoRoute(
          path: AppRoutes.orderSummaryScreen,
          name: AppRoutes.orderSummaryScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final extra = state.extra as Map<String, dynamic>?;

            return CustomTransitionPage(
              key: state.pageKey,
              child: OrderSummaryPage(
                customer: extra?['customer'] as CustomerModel,
                invoice: extra?['invoice'] as InvoiceModel?,
                openPayment: extra?['openPayment'] ?? false,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        ),
        // In your router configuration
        GoRoute(
          name: AppRoutes.invoiceReviewScreen,
          path: AppRoutes.invoiceReviewScreen,
          // path: '/invoice-review',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return UnifiedInvoiceReviewPage(
              mode: extra['mode'] as InvoiceReviewMode,
              invoiceId: extra['invoiceId'] as String?,
            );
          },
        ),
        GoRoute(
          path: AppRoutes.barcodeScreen,
          name: AppRoutes.barcodeScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: BarcodeScannerPage(
                fromNewOrder: state.extra as bool,
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
          path: AppRoutes.displayCaptureScreen,
          name: AppRoutes.displayCaptureScreen,
          parentNavigatorKey: rootKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              child: DisplayCapturePage(
              ),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        ),
      ],
    );
  }
}
