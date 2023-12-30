import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/text_input_field/text_input_field.dart';
import '../controller/signin_controller.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInState signInState = ref.watch(signInProvider);
    final bool showError =
        signInState.password.isNotValid && !signInState.password.isPure;
    final SignInController signInController = ref.read(signInProvider.notifier);

    return TextInputField(
      obscureText: true,
      hintText: "Password",
      errorText: showError
          ? Password.showPasswordErrorMessage(signInState.password.error)
          : null,
      onChanged: (String password) =>
          signInController.onPasswordChange(password),
    );
  }
}
