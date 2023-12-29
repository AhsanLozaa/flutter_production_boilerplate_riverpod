import 'package:flutter/material.dart';
import 'fields/button.dart';
import 'fields/email_field.dart';
import 'fields/error.dart';
import 'fields/name_field.dart';
import 'fields/password_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NameField(),
        SizedBox(height: 16),
        EmailField(),
        SizedBox(height: 16),
        PasswordField(),
        SizedBox(height: 24),
        SignUpButton(),
        SignUpError(),
      ],
    );
  }
}
