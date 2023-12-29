import 'package:flutter/material.dart';

class ResponsiveLayoutWidget extends StatelessWidget {
  final Widget? mobile;
  final Widget? tab;
  final Widget? webAndDesktop;
  const ResponsiveLayoutWidget({
    super.key,
    this.mobile,
    this.tab,
    this.webAndDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        return mobile!;
      } else if (constraints.maxWidth < 1200 && tab != null) {
        return tab!;
      } else {
        return webAndDesktop!;
      }
    });
  }
}
