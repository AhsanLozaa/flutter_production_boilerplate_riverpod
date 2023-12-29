import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signup/controller/signup_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/text_input_field/text_input_field.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.email.isNotValid && !signUpState.email.isPure;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: "Email",
      errorText: showError
          ? Email.showEmailErrorMessage(signUpState.email.error)
          : null,
      onChanged: (email) => signUpController.onEmailChange(email),
    );
  }
}
