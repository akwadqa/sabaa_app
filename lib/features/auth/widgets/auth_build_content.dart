import 'package:flutter/material.dart';
import 'package:sabaa/features/auth/widgets/white_dots_generator.dart';
import 'package:sabaa/gen/assets.gen.dart';
import 'package:sabaa/src/resourses/color_manager/app_colors.dart';

// enum AuthPageType { login, signup, verifyOtp }

class AuthScreen extends StatelessWidget {
  final Widget child;

  final bool withBackButton;

  const AuthScreen(
      {super.key, required this.child, this.withBackButton = false});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            // Gradient + White Dots Background
            Assets.images.authBackground.image(fit: BoxFit.fitHeight,height: height),
            // Container(
            //   height: height / 2,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment(0.0, 0.5),
            //       end: Alignment(1.0, 0.5),
            //       colors: [
            //         AppColors.primary,
            //         AppColors.secondPrimary,
            //       ],
            //     ),
            //   ),
            //   child: Stack(
            //     children: [
            //       ...generateWhiteDots(
            //         count: 70,
            //         maxWidth: width,
            //         maxHeight: height / 2,
            //       ),
            //     ],
            //   ),
            // ),

            // Card with content
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: height * 0.65,minHeight: height *0.5),
                child: Container(
                    width: width * 0.9,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: [
                        BoxShadow(
                          color: AppColors.grayBorder,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: child
                    // _buildCardContent(),
                    ),
              ),
            ),

            //? Back button
            if (withBackButton)
              PositionedDirectional(
                  top: 73,
                  start: 24,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment(1.0, 0.5),
                          colors: [
                            AppColors.secondPrimary,
                            AppColors.primary,
                            

                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: AppColors.background,
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }

  // Widget _buildCardContent() {
  //   switch (pageType) {
  //     case AuthPageType.login:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             'Log in',
  //             style: TextStyle(
  //               color: Color(0xFF3B41C5),
  //               fontSize: 32,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //           const SizedBox(height: 12),
  //           Text('Enter your number to log in'),
  //           const SizedBox(height: 24),
  //           // Phone Input Example
  //           Container(
  //             width: 279,
  //             height: 46,
  //             decoration: ShapeDecoration(
  //               color: Colors.white,
  //               shape: RoundedRectangleBorder(
  //                 side: BorderSide(width: 1, color: Color(0xFFEFF0F6)),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 24),
  //           ElevatedButton(
  //             onPressed: () {},
  //             style: ElevatedButton.styleFrom(
  //               minimumSize: Size(double.infinity, 48),
  //               backgroundColor: Color(0xFF3B41C5),
  //             ),
  //             child: Text('Log In'),
  //           ),
  //         ],
  //       );

  //     case AuthPageType.signup:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text('Sign Up', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
  //           const SizedBox(height: 16),
  //           Text('Create your new account'),
  //           const SizedBox(height: 24),
  //           // Input fields
  //           Container(height: 46, color: Colors.grey[200]),
  //           const SizedBox(height: 12),
  //           Container(height: 46, color: Colors.grey[200]),
  //           const SizedBox(height: 24),
  //           ElevatedButton(
  //             onPressed: () {},
  //             style: ElevatedButton.styleFrom(
  //               minimumSize: Size(double.infinity, 48),
  //             ),
  //             child: Text('Sign Up'),
  //           ),
  //         ],
  //       );

  //     case AuthPageType.verifyOtp:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text('Verify OTP', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
  //           const SizedBox(height: 16),
  //           Text('Enter the OTP sent to your number'),
  //           const SizedBox(height: 24),
  //           // OTP input example
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: List.generate(4, (_) => Container(width: 40, height: 46, color: Colors.grey[200])),
  //           ),
  //           const SizedBox(height: 24),
  //           ElevatedButton(
  //             onPressed: () {},
  //             style: ElevatedButton.styleFrom(
  //               minimumSize: Size(double.infinity, 48),
  //             ),
  //             child: Text('Verify'),
  //           ),
  //         ],
  //       );
  //   }
  // }
}
