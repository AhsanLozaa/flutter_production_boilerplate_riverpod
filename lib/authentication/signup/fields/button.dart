import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signup/controller/signup_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/animated_button/animated_button.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/button_styles/authentication_button_style.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final bool isValidated = signUpState.isValid;
    final bool isLoading =
        signUpState.status == FormzSubmissionStatus.inProgress;
    return AnimatedButton(
      onTap: isValidated
          ? () => signUpController.signUpWithEmailAndPassword()
          : null,
      child: AuthButtonStyle(
        title: "Sign Up",
        isLoading: isLoading,
      ),
    );
  }
}
