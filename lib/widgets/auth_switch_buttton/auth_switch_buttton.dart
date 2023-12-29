import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/animations/slide_fade_switcher.dart';

const _kTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xFF9A9A9A),
);

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;
  const AuthSwitchButton({
    super.key,
    required this.showSignIn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: SlideFadeSwitcher(
            child: showSignIn
                ? const Text(
                    "Don't have account? Sign Up",
                    style: _kTextStyle,
                    key: ValueKey("SignUp"),
                  )
                : const Text(
                    "Already have account? Sign In",
                    style: _kTextStyle,
                    key: ValueKey("SignIn"),
                  ),
          ),
        ),
      ),
    );
  }
}
