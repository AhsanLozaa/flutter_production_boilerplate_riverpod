import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../authentication/controller/authentication_controller.dart';
import '../../states/reset_providers.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider.notifier);
    return TextButton(
      onPressed: () {
        resetProviders(ref);
        authController.signOut();
      },
      child: const Text(
        'Sign Out',
      ),
    );
  }
}
