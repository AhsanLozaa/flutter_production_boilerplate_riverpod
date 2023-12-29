import 'package:flutter/material.dart';

class CenterTextDivider extends StatelessWidget {
  String? text;
  CenterTextDivider({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
      ),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Visibility(
            visible: text != null,
            child: Text(
              text!,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
