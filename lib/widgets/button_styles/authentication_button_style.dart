import 'package:flutter/material.dart';

class AuthButtonStyle extends StatelessWidget {
  String title;
  bool isLoading;
  AuthButtonStyle({
    super.key,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      // child: Text(
      //   title,
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 18,
      //   ),
      // ),
      child: !isLoading
          ? Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          : const Center(
              child: SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
