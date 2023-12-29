import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/controller/authentication_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider.notifier);
    return TextButton(
      onPressed: () => authController.signOut(),
      child: const Text(
        "Sign Out",
      ),
    );
  }
}
