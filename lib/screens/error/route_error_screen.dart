import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterErrorScreen extends StatefulWidget {
  final String errorMessage;
  const RouterErrorScreen({super.key, required this.errorMessage});

  @override
  State<RouterErrorScreen> createState() => _RouterErrorScreenState();
}

class _RouterErrorScreenState extends State<RouterErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Visibility(
              visible: kDebugMode,
              child: Text(
                widget.errorMessage,
                style: const TextStyle(color: Colors.redAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO - IMPORTANT - write the code here, if the user is authenticated go back to home screen, else go back to authentication screen
                // also delete all the previous routes
                GoRouter.of(context).go('/auth');
              },
              child: const Column(
                children: [
                  Icon(Icons.home),
                  Text(
                    "Error, Go back to Home",
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
