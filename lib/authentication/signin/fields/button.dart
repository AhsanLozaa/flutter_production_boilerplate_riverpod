import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signin/controller/signin_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/animated_button/animated_button.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/button_styles/authentication_button_style.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final signInController = ref.read(signInProvider.notifier);
    final bool isValidated = signInState.isValid;
    final bool isLoading =
        signInState.status == FormzSubmissionStatus.inProgress;

    return AnimatedButton(
      onTap: () {
        print("isValidated");
        print(isValidated);
      },
      // onTap: isValidated
      //     ? () => signInController.signInWithEmailAndPassword()
      //     : null,
      child: AuthButtonStyle(
        title: "Sign In",
        isLoading: isLoading,
      ),
    );
  }
}
