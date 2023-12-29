import 'package:flutter/material.dart';

class UnderDevelopmentWidget extends StatelessWidget {
  String message;
  UnderDevelopmentWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
