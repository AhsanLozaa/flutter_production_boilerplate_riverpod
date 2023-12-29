import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signin/controller/signin_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/text_input_field/text_input_field.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final showError = signInState.email.isNotValid && !signInState.email.isPure;
    final signInController = ref.read(signInProvider.notifier);

    return TextInputField(
      hintText: "Email",
      errorText: showError
          ? Email.showEmailErrorMessage(signInState.email.error)
          : null,
      onChanged: (email) => signInController.onEmailChange(email),
    );
  }
}
