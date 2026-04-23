// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:sabaa/features/van_stock/presentation/widgets/filter_search_bar.dart';
// import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
// import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
// import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
// import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

// import '../../domain/model/route_stop_model.dart';
// import '../../domain/model/week_day_model.dart';
// import '../widgets/route_stop_card.dart';
// import '../widgets/week_day_picker.dart';

// class MyRoutePage extends StatefulWidget {
//   const MyRoutePage({super.key});

//   @override
//   State<MyRoutePage> createState() => _MyRoutePageState();
// }

// class _MyRoutePageState extends State<MyRoutePage> {
//   final TextEditingController _searchController = TextEditingController();
//   int _selectedDayIndex = 1; // TUE selected by default

//   // ── Static data (replace with BLoC / provider) ────────────────────────────

//   static const List<WeekDay> _weekDays = [
//     WeekDay(dayKey: 'day_mon', date: '12', isSelected: false),
//     WeekDay(dayKey: 'day_tue', date: '13', isSelected: true),
//     WeekDay(dayKey: 'day_wed', date: '14', isSelected: false),
//     WeekDay(dayKey: 'day_thu', date: '15', isSelected: false),
//     WeekDay(dayKey: 'day_fri', date: '16', isSelected: false),
//     WeekDay(dayKey: 'day_sat', date: '17', isSelected: false),
//   ];

//   static const List<RouteStop> _stops = [
//     RouteStop(
//       id:           's1',
//       order:        1,
//       customerName: 'Carrefour City Center',
//       address:      'Downtown Zone A, Block 4',
//       status:       RouteStopStatus.inProgress,
//       elapsedTime:  '00:12:45',
//     ),
//     RouteStop(
//       id:           's2',
//       order:        2,
//       customerName: 'Lulu Hypermarket',
//       address:      'Al Rigga Road, Deira',
//       status:       RouteStopStatus.pending,
//     ),
//     RouteStop(
//       id:           's3',
//       order:        3,
//       customerName: 'Spinneys Market',
//       address:      'Jumeirah Beach Road',
//       status:       RouteStopStatus.visited,
//       checkedOutAt: '09:45 AM',
//     ),
//     RouteStop(
//       id:           's4',
//       order:        4,
//       customerName: 'Lulu Hypermarket',
//       address:      'Al Rigga Road, Deira',
//       status:       RouteStopStatus.pending,
//     ),
//     RouteStop(
//       id:           's5',
//       order:        5,
//       customerName: 'Lulu lili',
//       address:      'Al Rigga Road, Deira',
//       status:       RouteStopStatus.inProgress,
//     ),
//   ];

//   List<WeekDay> get _days => List.generate(
//         _weekDays.length,
//         (i) => WeekDay(
//           dayKey:     _weekDays[i].dayKey,
//           date:       _weekDays[i].date,
//           isSelected: i == _selectedDayIndex,
//         ),
//       );

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildAppBar(),
//                   16.verticalSpace,
//                   WeekDayPicker(
//                     days: _days,
//                     onDaySelected: (i) =>
//                         setState(() => _selectedDayIndex = i),
//                   ).onlyPadding(start:12),
//                   20.verticalSpace,
//                   _TodayStopsHeader(count: _stops.length).symmetricPadding(horizontal: 12),
//                   14.verticalSpace,
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 children: [

//                   ..._stops.map(
//                     (stop) => Padding(
//                       padding: const EdgeInsets.only(bottom: 12),
//                       child: RouteStopCard(
//                         stop:          stop,
//                         onCheckIn:     () => _onCheckIn(stop),
//                         onCheckOut:    () => _onCheckOut(stop),
//                         onNavigate:    () => _onNavigate(stop),
//                         onContact:     () => _onContact(stop),
//                         onViewSummary: () => _onViewSummary(stop),
//                       ),
//                     ),
//                   ),
//                   16.verticalSpace,
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ── App bar ─────────────────────────────────────────────────────────────────

//   Widget _buildAppBar() {
//     return Center(
//       child: Text(
//         'my_routes'.tr(),
//         style: AppTextStyle.interBold20.copyWith(color: AppColors.dark),
//       ),
//     ).symmetricPadding(vertical: 20);
//   }

//   // ── Search bar ──────────────────────────────────────────────────────────────

//   // Widget _buildSearchBar() {
//   //   return Container(
//   //     decoration: BoxDecoration(
//   //       color: AppColors.white,
//   //       borderRadius: BorderRadius.circular(12),
//   //       border: Border.all(color: AppColors.navBorder),
//   //     ),
//   //     child: Row(
//   //       children: [
//   //         const SizedBox(width: 12),
//   //         const Icon(Icons.search, color: AppColors.textSecondary, size: 20),
//   //         const SizedBox(width: 8),
//   //         Expanded(
//   //           child: TextField(
//   //             controller: _searchController,
//   //             style: AppTextStyle.interRegular16.copyWith(
//   //               color: AppColors.textPrimary,
//   //             ),
//   //             decoration: InputDecoration(
//   //               hintText: 'search_customer'.tr(),
//   //               hintStyle: AppTextStyle.interRegular16.copyWith(
//   //                 color: AppColors.textSecondary,
//   //               ),
//   //               border: InputBorder.none,
//   //               isDense: true,
//   //               contentPadding: const EdgeInsets.symmetric(vertical: 13),
//   //             ),
//   //           ),
//   //         ),
//   //         Padding(
//   //           padding: const EdgeInsets.symmetric(horizontal: 12),
//   //           child: Icon(
//   //             Icons.tune_rounded,
//   //             color: AppColors.textSecondary,
//   //             size: 20,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   // ── Callbacks ───────────────────────────────────────────────────────────────

//   void _onCheckIn(RouteStop stop)     { /* TODO */ }
//   void _onCheckOut(RouteStop stop)    { /* TODO */ }
//   void _onNavigate(RouteStop stop)    { /* TODO */ }
//   void _onContact(RouteStop stop)     { /* TODO */ }
//   void _onViewSummary(RouteStop stop) { /* TODO */ }
// }

// // ── Today's Stops header ──────────────────────────────────────────────────────

// class _TodayStopsHeader extends StatelessWidget {
//   const _TodayStopsHeader({required this.count});

//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       spacing: 8,
//       children: [
//         Text(
//           'todays_stops'.tr(),
//           style: AppTextStyle.interBold18.copyWith(
//             color: AppColors.textPrimary,
//           ),
//         ),
//         // const SizedBox(width: 8),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//           decoration: BoxDecoration(
//             color: AppColors.navBorder,
//             borderRadius: BorderRadius.circular(18),
//           ),
//           child: Text(
//             '$count',
//             style: AppTextStyle.interMedium12.copyWith(
//               color: AppColors.textSecondary,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/my_trips/domain/model/route_stop_model.dart';
import 'package:sabaa/features/my_trips/presentation/controller/my_trips_controller.dart';
import 'package:sabaa/features/my_trips/presentation/controller/my_trips_state.dart';
import 'package:sabaa/features/my_trips/presentation/widgets/route_stop_card.dart';
import 'package:sabaa/features/my_trips/presentation/widgets/week_day_picker.dart';
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
    // final asyncState = ref.watch(myTripsControllerProvider);

    return _RouteBody();
    // asyncState.when(
    //   loading: () => const AppLoader(),
    //   error: (e, _) => AppErrorWidget(),
    //   data: (state) => _RouteBody(state: state),
    // );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _RouteBody extends ConsumerWidget {
  const _RouteBody();

  // final MyTripsState state;

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
                .symmetricPadding(horizontal: 12),
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
                            onContact: () => openPhoneDialer(stop.customerPhone),
                            onViewSummary: () => _onViewSummary(stop),
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

  void _onNavigate(RouteStop stop) {/* TODO */}
  void _onContact(RouteStop stop) {openPhoneDialer(stop.customerPhone);}
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
