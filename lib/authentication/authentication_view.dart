import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signin/signin.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signup/signup.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/animations/slide_fade_switcher.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/auth_switch_buttton/auth_switch_buttton.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/responsive_layout_widget/responsive_layout_widget.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool _showSignIn = true;
  @override
  Widget build(BuildContext context) {
    // EdgeInsets edgeInsets = MediaQuery.of(context).viewInsets;
    // EdgeInsets padding = MediaQuery.of(context).padding;
    return ResponsiveLayoutWidget(
      mobile: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                250,
                16,
                0,
              ),
              child: SlideFadeSwitcher(
                  child: _showSignIn ? const SignIn() : const SignUp()),
            ),
            AuthSwitchButton(
                showSignIn: _showSignIn,
                onTap: () {
                  setState(() {
                    _showSignIn = !_showSignIn;
                  });
                })
          ],
        ),
      ),
      webAndDesktop: Scaffold(
        // resizeToAvoidBottomInset: false,
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        body: _showSignIn ? const SignIn() : const SignUp(),
      ),
    );
  }
}
