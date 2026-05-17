import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabaa/features/auth/signIn/presentation/controller/sign_in_controller.dart';
import 'package:sabaa/features/auth/widgets/text_form_fields/email_text_form_field.dart';
import 'package:sabaa/features/auth/widgets/text_form_fields/password_form_field.dart';
import 'package:sabaa/features/home/presentation/controller/home_controller.dart';
import 'package:sabaa/src/application/router/app_routes.dart';
import 'package:sabaa/src/core/shared_widgets/app_loader.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/shared_widgets/custom_button_widget.dart';
import 'package:sabaa/src/core/utils/extenssions/int_extenssion.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import 'package:sabaa/src/resourses/font_manager/app_text_style.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  // String? _phoneNumber;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.listen(signInControllerProvider, (prev, next) {
      if (next is AsyncData && prev is AsyncLoading) {
        // context.maybePop().then((_) {
        debugPrint("Success check");
        if (next.value!.signinResponseModel!.user.isEnabled) {
          ref.invalidate(homeControllerProvider);
          context.goNamed(
            AppRoutes.mainScreen,
          );
        }
      } else if (next is AsyncError) {
        AppToast.errorToast(next.error.toString());
      }
    });

    return Form(
      key: _formKey,
      child: Column(
        spacing: 22,
        children: [
          EmailTextFormField(
            emailController: emailController,
            onSaved: (value) {
              ref.read(signInControllerProvider.notifier).updateEmail(value!);
            },
          ),
          PasswordFormField(
            passwordController: passwordController,
            onSaved: (value) {
              ref
                  .read(signInControllerProvider.notifier)
                  .updatePassword(value!);
            },
          ),
          // 20.verticalSpace,
          Consumer(builder: (context, ref, child) {
            final signInProvider = ref.watch(signInControllerProvider);

            if (signInProvider is AsyncLoading) {
              return AppLoader();
            }
            final isEnabled = signInProvider.value?.isFormValid ?? false;

            return CustomButtonWidget(
              text: 'login'.tr(),
              style: AppTextStyle.rubikBold18.copyWith(color: AppColors.white),
              onTap: () => !isEnabled ? null : _submit(ref),
              isFiled: true,
              height: 48,
              width: double.infinity,
              backgroundColor: !isEnabled ? AppColors.gray : AppColors.primary,
              radius: 8,
            );
            // return Container();
          }),
        ],
      ),
    );
  }

  Future<void> _submit(WidgetRef ref) async {
    final isValid = _formKey.currentState!.validate();
    debugPrint('FORM VALID: $isValid');
    if (!isValid) return;

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      await ref
          .read(signInControllerProvider.notifier)
          .signIn(emailController.text, passwordController.text);
    }
  }
}
