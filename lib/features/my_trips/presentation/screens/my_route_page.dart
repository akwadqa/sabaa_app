import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/my_trips/domain/model/route_stop_model.dart';
import 'package:sabaa/features/my_trips/presentation/controller/my_trips_controller.dart';
import 'package:sabaa/features/my_trips/presentation/controller/my_trips_state.dart';
import 'package:sabaa/features/my_trips/presentation/widgets/route_stop_card.dart';
import 'package:sabaa/features/my_trips/presentation/widgets/week_day_picker.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_error_widget.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/core/utils/functions/helper_methods.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class MyRoutePage extends ConsumerWidget {
  const MyRoutePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _RouteBody();
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _RouteBody extends ConsumerWidget {
  const _RouteBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(myTripsControllerProvider);
    final isToday = asyncState.requireValue.selectedDate;

    final isDisabled = !DateUtils.isSameDay(isToday, DateTime.now());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── App bar ──────────────────────────────────────────────
            _buildAppBar(),
            16.verticalSpace,

            // ── Week day picker ──────────────────────────────────────
            WeekDayPicker(
              days: asyncState.requireValue.weekDays,
              onDaySelected: (date) =>
                  ref.read(myTripsControllerProvider.notifier).selectDay(date),
            ),
            20.verticalSpace,

            // ── Today's stops header ─────────────────────────────────
            _TodayStopsHeader(count: asyncState.requireValue.stops.length)
                .onlyPadding(start: 20),
            14.verticalSpace,

            // ── Stop list ────────────────────────────────────────────
            asyncState.when(
              loading: () => const AppLoader()
                  .onlyPadding(top: MediaQuery.sizeOf(context).width / 2),
              error: (e, _) => AppErrorWidget(),
              data: (state) => Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () =>
                      ref.read(myTripsControllerProvider.notifier).refresh(),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      // Non-blocking loading indicator
                      if (state.pageState is AsyncLoading) AppLoader(),

                      ...state.stops.map(
                        (stop) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: RouteStopCard(
                            stop: stop,
                            onCheckIn:
                                isDisabled ? null : () => _onCheckIn(ref, stop),
                            onCheckOut: isDisabled
                                ? null
                                : () => _onCheckOut(ref, stop),
                            onNavigate: () => _onNavigate(stop),
                            onContact: () =>
                                openPhoneDialer(stop.customerPhone),
                            onViewSummary: () => _onViewSummary(stop),
                            onTap: () => stop.status != RouteStopStatus.pending
                                ? context.push(
                                    AppRoutes.orderSummaryScreen,
                                    extra: {
                                      'customer': CustomerModel(
                                          customerId: stop.customerId,
                                          name: stop.customerName),
                                      'invoice': null,
                                      'openPayment': false,
                                      'visitId': stop.id,
                                    },
                                    // extra: CustomerModel(
                                    //     customerId: stop.customerId,
                                    //     name: stop.customerName)
                                  )
                                : null,
                          ),
                        ),
                      ),
                      16.verticalSpace,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ── App bar ─────────────────────────────────────────────────────────────────

  Widget _buildAppBar() {
    return Center(
      child: Text(
        'my_trips'.tr(),
        style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
      ),
    ).symmetricPadding(vertical: 20);
  }

  // ── Callbacks ────────────────────────────────────────────────────────────────

  void _onCheckIn(WidgetRef ref, RouteStop stop) {
    ref.read(myTripsControllerProvider.notifier).updateVisitStatus(
          visitId: stop.id,
          status: RouteStopStatus.inProgress,
        );
  }

  void _onCheckOut(WidgetRef ref, RouteStop stop) {
    ref.read(myTripsControllerProvider.notifier).updateVisitStatus(
          visitId: stop.id,
          status: RouteStopStatus.completed,
        );
  }

  // void _onSkipAction(WidgetRef ref, RouteStop stop) {
  //   ref.read(myTripsControllerProvider.notifier).updateVisitStatus(
  //         visitId: stop.id,
  //         status: RouteStopStatus.skipped,
  //       );
  // }

  void _onNavigate(RouteStop stop) {/* TODO */}
  void _onContact(RouteStop stop) {
    openPhoneDialer(stop.customerPhone);
  }

  void _onViewSummary(RouteStop stop) {/* TODO */}
}

// ── Today's Stops header ──────────────────────────────────────────────────────

class _TodayStopsHeader extends StatelessWidget {
  const _TodayStopsHeader({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(
          'todays_stops'.tr(),
          style: AppTextStyle.interBold18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.navBorder,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            '$count',
            style: AppTextStyle.interMedium12.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
