import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/signup/controller/signup_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/text_input_field/text_input_field.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NameField extends ConsumerWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.name.isNotValid && !signUpState.name.isPure;
    final signUpController = ref.read(signUpProvider.notifier);

    return TextInputField(
      hintText: "Name",
      // errorText: signUpState.name.isNotValid && !signUpState.name.isPure
      errorText:
          showError ? Name.showNameErrorMessage(signUpState.name.error) : null,
      onChanged: (name) => signUpController.onNameChange(name),
    );
  }
}
