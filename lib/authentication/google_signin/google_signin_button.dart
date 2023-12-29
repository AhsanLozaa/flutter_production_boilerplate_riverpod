import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/animated_button/animated_button.dart';

class GoogleSignInButton extends StatelessWidget {
  Color textColor;
  GoogleSignInButton({
    super.key,
    this.textColor = const Color(0xFF9A9A9A),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Text(
          "Sign In With Google",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
