import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(CupertinoPageRoute(
        //   fullscreenDialog: true,
        //   builder: (_) => const ForgotPasswordScreen(),
        // ));
        GoRouter.of(context).go('/forgot_password');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
