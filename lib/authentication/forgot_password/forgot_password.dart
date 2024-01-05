import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/responsive_layout_widget/responsive_layout_widget.dart';
import 'fields/cancel_button.dart';
import 'fields/email_field.dart';
import 'fields/request_button.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsiveLayoutWidget(
      mobile: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                EmailField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CancelButton(),
                    RequestButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      tab: Center(
        child: Text('Under development'),
      ),
    );
  }
}
