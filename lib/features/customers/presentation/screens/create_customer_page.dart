import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/auth/widgets/text_form_fields/login_page_number_field.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/presentation/controller/customer_controller.dart';
import 'package:sabaa/features/customers/presentation/widgets/add_customer_page/custom_labeld_drop_down.dart';
import 'package:sabaa/features/customers/presentation/widgets/add_customer_page/custom_labeled_text_filed.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/shared_widgets/custom_app_bar.dart';
import 'package:sabaa/src/core/shared_widgets/custom_appbar.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class CreateCustomerPage extends StatelessWidget {
  const CreateCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomDeafultAppbar(
        title: 'register_new_customer'.tr(),
      ),
      body: const _CreateCustomerPageContent(),
    );
  }
}

class _CreateCustomerPageContent extends ConsumerStatefulWidget {
  const _CreateCustomerPageContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCustomerPageContentState();
}

class _CreateCustomerPageContentState
    extends ConsumerState<_CreateCustomerPageContent> {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _streetController = TextEditingController();
  // final TextEditingController _buildingController = TextEditingController();

  // String? _selectedType;
  // String? _selectedGroup;
  // String? _selectedZone;

  final List<String> _types = ['Type A', 'Type B'];
  final List<String> _groups = ['Group 1', 'Group 2'];
  final List<String> _zones = ['Zone 1', 'Zone 2', 'Zone 3'];

  @override
  void dispose() {
    // _nameController.dispose();
    // _phoneController.dispose();
    // _streetController.dispose();
    // _buildingController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final customer = ref.watch(customersControllerProvider).value;
    final controller = ref.watch(customersControllerProvider.notifier);

    final createCustomerResponse = ref.watch(customersControllerProvider.select(
          (state) => state.value?.createCustomerResponse,
        )) ??
        AsyncData(CustomerModel());

    ref.listen(
        customersControllerProvider.select(
            (state) => state.value?.createCustomerResponse), (previous, next) {
      if (next is AsyncData) {
        context.go(AppRoutes.createCustomerSuccessScreen);
      }
      if (next is AsyncError) {
        AppToast.errorToast(next?.error.toString() ?? 'Error');
      }
    });

    Dev.logLine('Current create customer response: $createCustomerResponse');

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'fill_registration_form'.tr(),
              style:
                  AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 24),

            // Name Field
            CustomLabeledTextField(
              label: 'customer_name',
              hint: 'enter_full_name',
              // controller: _nameController,
              onChanged: (value) => controller.changeName(value),
            ),
            const SizedBox(height: 18),

            // Phone Number
            _buildLabel('phone_number'),
            const SizedBox(height: 8),
            LoginPageNumberField(
              null,
              // _phoneController,
              onChange: (phone) {
                Dev.logLine(phone?.completeNumber);
                controller.changePhone(phone!.completeNumber.toString());
              },
            ),
            const SizedBox(height: 18),

            // Customer Type
            // CustomLabeledDropdown(
            //   label: 'customer_type',
            //   hint: 'select_customer_type',
            //   value: customer?.customerType,
            //   items: _types,
            //   onChanged: (value) => controller.changeSelectedType(value),
            // ),
            // const SizedBox(height: 18),

            // Customer Group
            // CustomLabeledDropdown(
            //   label: 'customer_group',
            //   hint: 'select_customer_group',
            //   value: customer?.customerGroup,
            //   items: _groups,
            //   onChanged: (value) => controller.changeSelectedGroup(value),
            // ),
            // const SizedBox(height: 18),

            // Street Number
            CustomLabeledTextField(
              label: 'street_number',
              hint: 'enter_street_number',
              onChanged: (value) => controller.changeStreet(value),
              // controller: _streetController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 18),

            // Building Number
            CustomLabeledTextField(
              label: 'building_number',
              hint: 'enter_building_number',
              onChanged: (value) => controller.changeBuilding(value),
              // controller: _buildingController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 18),

            // Zone Number
            // CustomLabeledDropdown(
            //   label: 'zone_number',
            //   hint: 'select_zone_number',
            //   value: customer?.zone,
            //   items: _zones,
            //   onChanged: (value) => controller.changeSelectedZone(value),
            // ),
            CustomLabeledTextField(
              label: 'zone_number',
              hint: 'select_zone_number',
              onChanged: (value) => controller.changeSelectedZone(value),
              // controller: _buildingController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 18),

            22.verticalSpace,
            createCustomerResponse.maybeWhen(
              orElse: () => CustomButtonWidget(
                  text: '',
                  elevation: 10,
                  shadowColor: AppColors.primary.withOpacity(0.3),
                  backgroundColor: (controller.isFormValid &&
                          _formKey.currentState?.validate() == true)
                      ? AppColors.primary
                      : AppColors.grey,
                  radius: 12,
                  onTap: (controller.isFormValid &&
                          _formKey.currentState?.validate() == true)
                      ? () {
                          ref
                              .read(customersControllerProvider.notifier)
                              .saveCustomer();
                        }
                      : null,
                  isFiled: false,
                  height: 48,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 14,
                    children: [
                      Assets.icons.saveCustomerIc.svg(),
                      Text(
                        'save_customer'.tr(),
                        style: AppTextStyle.rubikBold18
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  )),
              loading: () => const AppLoader(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Row(
      children: [
        Text(
          label.tr(),
          style: AppTextStyle.rubikSemiBold16.copyWith(color: AppColors.dark),
        ),
        const SizedBox(width: 4),
        Text(
          '*',
          style: AppTextStyle.rubikBold16.copyWith(color: AppColors.newRed),
        ),
      ],
    );
  }
}
