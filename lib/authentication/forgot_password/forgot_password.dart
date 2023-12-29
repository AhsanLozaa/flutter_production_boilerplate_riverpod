import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/widgets/text_input_field/text_input_field.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                hintText: "Please enter yur Email",
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
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Request"),
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
