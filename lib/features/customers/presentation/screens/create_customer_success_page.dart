import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/presentation/controller/customer_controller.dart';
import 'package:sabaa/features/customers/presentation/widgets/create_customer_success_page/customer_info_card.dart';
import 'package:sabaa/features/customers/presentation/widgets/create_customer_success_page/customer_success_message.dart';
import 'package:sabaa/features/customers/presentation/widgets/create_customer_success_page/success_icon_indicator.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CreateCustomerSuccessPage extends ConsumerWidget {
  const CreateCustomerSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref
        .watch(customersControllerProvider)
        .value!
        .createCustomerResponse!
        .value!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              45.verticalSpace,
              // Success Icon Section
              const SuccessIcon(),
              24.verticalSpace,
              const CustomerSuccessMessage(),
              30.verticalSpace,
              CustomerInfoCard(
                shopName: '${customer.name} Supermarket',
                customerName: customer.name ?? 'name',
                phoneNumber: customer.phone ?? '0000000000',
                address: customer.address ?? 'address',
              ),
              30.verticalSpace,
              CustomButtonWidget(
                text: 'done'.tr(),
                elevation: 10,
                shadowColor: AppColors.primary.withOpacity(0.3),
                backgroundColor: AppColors.primary,
                radius: 12,
                onTap: () {
                  ref
                      .read(customersControllerProvider.notifier)
                      .getCustomers(page: 1, showLoading: true);
                  context.go(AppRoutes.mainScreen);
                },
                isFiled: false,
                height: 48,
                width: 300,
                style:
                    AppTextStyle.rubikBold18.copyWith(color: AppColors.white),
              ),
              12.verticalSpace,
              CustomButtonWidget(
                text: 'proceed_to_create_order'.tr(),
                elevation: 5,
                // shadowColor: AppColors.primary.withOpacity(0.3),
                backgroundColor: AppColors.white,
                radius: 12,
                onTap: () {
                  context.go(AppRoutes.mainScreen);

                  context.push(AppRoutes.newOrderScreen, extra: customer);

                  ref
                      .read(customersControllerProvider.notifier)
                      .getCustomers(page: 1, showLoading: true);
                },
                isFiled: false,
                height: 48,
                width: 300,
                style:
                    AppTextStyle.rubikBold18.copyWith(color: AppColors.primary),
              ),
              12.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessIcon extends StatefulWidget {
  const SuccessIcon({super.key});

  @override
  State<SuccessIcon> createState() => SuccessIconState();
}

class SuccessIconState extends State<SuccessIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 144, // Fixed size to prevent layout shifting
        height: 144,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animated Ripple Effect
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildRipple(1.0),
                    _buildRipple(0.5),
                  ],
                );
              },
            ),
            // Static Primary Circle with Checkmark
            Container(
              width: 96,
              height: 96,
              padding: EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26001A40),
                    blurRadius: 40,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: Assets.icons.successCreateCustomerIc.svg(),
              // child: Container(
              //   // width: 60,
              //   // height: 60,
              //   margin: EdgeInsets.all(25),
              //   decoration: const BoxDecoration(
              //     color: AppColors.white,
              //     shape: BoxShape.circle,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0x26001A40),
              //         blurRadius: 40,
              //         offset: Offset(0, 20),
              //       ),
              //     ],
              //   ),
              //   child: const Icon(
              //     Icons.check,
              //     color: AppColors.primary,
              //     size: 20,
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRipple(double initialDelay) {
    final progress = (_controller.value + initialDelay) % 1.0;
    final opacity = (1.0 - progress).clamp(0.0, 1.0);
    final size = 96 + (48 * progress);

    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _CustomerInfoCard extends StatelessWidget {
  final String shopName;
  final String customerName;
  final String phoneNumber;
  final String address;

  const _CustomerInfoCard({
    required this.shopName,
    required this.customerName,
    required this.phoneNumber,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: BorderDirectional(
            start: BorderSide(color: AppColors.primary, width: 4)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A001A40),
            blurRadius: 40,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 18),
            _InfoRow(
              icon: Icons.person_outline,
              label: 'customer_name'.tr(),
              value: customerName,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.phone_outlined,
              label: 'phone_number'.tr(),
              value: phoneNumber,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: 'address_label'.tr(),
              value: address,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.storefront, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'customer_profile'.tr(),
                style:
                    AppTextStyle.rubikMedium18.copyWith(color: AppColors.grey),
              ),
              Text(
                shopName,
                style:
                    AppTextStyle.rubikBold20.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.grey, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.black,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style:
                    AppTextStyle.rubikRegular16.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
