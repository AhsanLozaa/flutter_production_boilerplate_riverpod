import 'package:flutter/material.dart';

import '../../widgets/dividors/center_text_divider.dart';
import '../../widgets/responsive_layout_widget/responsive_layout_widget.dart';
import '../../widgets/under_development/under_development.dart';
import '../google_signin/google_signin_button.dart';
import 'fields/button.dart';
import 'fields/email_field.dart';
import 'fields/error.dart';
import 'fields/forgot_password_button.dart';
import 'fields/password_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return ResponsiveLayoutWidget(
      mobile: Column(
        children: [
          // Email input field
          const EmailField(),

          // Vertical spacing
          const SizedBox(height: 16),

          // Password input field
          const PasswordField(),

          // "Forgot Password?" button
          const ForgotPasswordButton(),

          // Vertical spacing
          const SizedBox(height: 24),

          // Sign-in button
          const SignInButton(),

          const SignInError(),

          // or divider
          CenterTextDivider(
            text: 'or',
          ),

          GoogleSignInButton(),
        ],
      ),
      tab: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: renderImage(),
          ),
        ),
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
              left: width * 0.22,
              right: width * 0.22,
              top: height * 0.1,
              // bottom: height * 0.5,
            ),
            // color: Colors.red,
            child: SingleChildScrollView(
              child: Column(children: [
                const EmailField(),

                //     // Vertical spacing
                const SizedBox(height: 16),

                //     // Password input field
                const PasswordField(),

                //     // "Forgot Password?" button
                const ForgotPasswordButton(),

                //     // Vertical spacing
                const SizedBox(height: 24),

                //     // Sign-in button
                const SignInButton(),

                const SignInError(),

                //     // or divider
                CenterTextDivider(
                  text: "or",
                ),

                GoogleSignInButton(
                  textColor: Colors.red,
                ),
              ]),
            ),
          ),
        ),
      ]),
      webAndDesktop: UnderDevelopmentWidget(
        message: 'Web version  of this page is still under development',
      ),
    );
  }

  Image renderImage() {
    return Image.asset(
      "assets/images/2.jpg",
      fit: BoxFit.cover,
    );
  }
}
