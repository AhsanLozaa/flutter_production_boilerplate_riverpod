import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/text_input_field/text_input_field.dart';
import '../controller/forgot_password_controller.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    final showError = forgotPasswordState.email.isNotValid &&
        !forgotPasswordState.email.isPure;
    final forgotPasswordController = ref.read(forgotPasswordProvider.notifier);

    return TextInputField(
      hintText: "Please enter your email",
      errorText: showError
          ? Email.showEmailErrorMessage(forgotPasswordState.email.error)
          : null,
      onChanged: (email) => forgotPasswordController.onEmailChange(email),
    );
  }
}
