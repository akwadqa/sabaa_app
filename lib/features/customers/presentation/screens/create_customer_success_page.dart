import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/customers/presentation/controller/customer_controller.dart';
import 'package:sabaa/features/customers/presentation/widgets/create_customer_success_page/customer_info_card.dart';
import 'package:sabaa/features/customers/presentation/widgets/create_customer_success_page/customer_success_message.dart';
import 'package:sabaa/features/customers/presentation/widgets/create_customer_success_page/success_icon_indicator.dart';
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
        child: Column(
          children: [
            const SizedBox(height: 45),
            const SuccessIconIndicator(),
            const SizedBox(height: 24),
            const CustomerSuccessMessage(),
            const SizedBox(height: 30),
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
              style: AppTextStyle.rubikBold18.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
