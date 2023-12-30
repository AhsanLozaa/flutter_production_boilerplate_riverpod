import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/animated_button/animated_button.dart';
import '../../../widgets/button_styles/authentication_button_style.dart';
import '../controller/signin_controller.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInState signInState = ref.watch(signInProvider);
    final SignInController signInController = ref.read(signInProvider.notifier);
    final bool isValidated = signInState.isValid;
    final bool isLoading =
        signInState.status == FormzSubmissionStatus.inProgress;

    return AnimatedButton(
      onTap: () {
        print("isValidated");
        print(isValidated);
        signInController.signInWithEmailAndPassword();
      },
      // onTap: isValidated
      //     ? () => signInController.signInWithEmailAndPassword()
      //     : null,
      child: AuthButtonStyle(
        title: 'Sign In',
        isLoading: isLoading,
      ),
    );
  }
}
