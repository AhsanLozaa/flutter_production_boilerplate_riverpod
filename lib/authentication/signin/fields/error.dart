import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signin/controller/signin_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInError extends ConsumerWidget {
  const SignInError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final String? errorMessage = signInState.errorMessage;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        errorMessage ?? "",
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
