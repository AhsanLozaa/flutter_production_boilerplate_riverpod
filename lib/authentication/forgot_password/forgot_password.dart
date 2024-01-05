import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/text_input_field/text_input_field.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ForgotPasswordState forgotPaswordState =
        ref.watch(forgotPasswordProvider);
    final ForgotPasswordController forgotPaswordController =
        ref.read(forgotPasswordProvider.notifier);

    final bool showError =
        forgotPaswordState.email.isNotValid && !forgotPaswordState.email.isPure;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextInputField(
                hintText: 'Please enter your email',
                errorText: showError
                    ? Email.showEmailErrorMessage(
                        forgotPaswordState.email.error)
                    : null,
                onChanged: (String email) =>
                    forgotPaswordController.onEmailChange(email),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // TODO, this must be a close for the bottom down forgot password screen sheet or something similar
                      // Navigator.of(context).pop();
                      GoRouter.of(context).go(
                        '/auth',
                      );
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (forgotPaswordState.isValid) {
                        forgotPaswordController.requestResetPasswordEmail();
                      }
                    },
                    child: const Text('Request'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
