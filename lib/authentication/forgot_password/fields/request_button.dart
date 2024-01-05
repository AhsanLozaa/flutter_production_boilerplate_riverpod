import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/forgot_password_controller.dart';

class RequestButton extends ConsumerWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ForgotPasswordState forgotPaswordState =
        ref.watch(forgotPasswordProvider);
    final ForgotPasswordController forgotPaswordController =
        ref.read(forgotPasswordProvider.notifier);

    return TextButton(
      onPressed: () {
        if (forgotPaswordState.isValid) {
          forgotPaswordController.requestResetPasswordEmail();
        }
      },
      child: const Text('Request'),
    );
  }
}
