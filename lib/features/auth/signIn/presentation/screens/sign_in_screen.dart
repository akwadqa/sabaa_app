import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/auth/widgets/auth_build_content.dart';
import 'package:sabaa/src/core/utils/extenssions/widget_extensions.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';
import '../widgets/sign_in_footer.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/sign_in_header.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,

      resizeToAvoidBottomInset: false,
      body: AuthScreen(child: _SignInContent()),
    );
  }
}

class _SignInContent extends StatelessWidget {
  const _SignInContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      spacing: 14,
      children: [SignInHeader(), SignInForm(),],
    ).symmetricPadding(vertical: 12,);
  }
}
