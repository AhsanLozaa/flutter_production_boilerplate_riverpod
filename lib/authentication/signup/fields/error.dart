import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signup/controller/signup_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpError extends ConsumerWidget {
  const SignUpError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final String? errorMessage = signUpState.errorMessage;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        errorMessage ?? "",
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
