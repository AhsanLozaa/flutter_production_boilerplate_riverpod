import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signup/controller/signup_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/text_input_field/text_input_field.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError =
        signUpState.password.isNotValid && !signUpState.password.isPure;
    final signUpController = ref.read(signUpProvider.notifier);

    return TextInputField(
      obscureText: true,
      hintText: "Password",
      errorText: showError
          ? Password.showPasswordErrorMessage(signUpState.password.error)
          : null,
      onChanged: (password) => signUpController.onPasswordChange(password),
    );
  }
}
