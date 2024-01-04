import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/text_input_field/text_input_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/authentication_controller.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthController authController = ref.read(authProvider.notifier);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                hintText: 'Please enter your email',
                onChanged: (_) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      // authController.signOut()
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
