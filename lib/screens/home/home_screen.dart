import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/controller/authentication_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/screens/home/logout_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider.notifier);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Home"),
    //     actions: const [],
    //     centerTitle: true,
    //   ),
    //   body: Center(
    //     child: Column(
    //       children: [
    //         const Text("Home Page"),
    //         TextButton(
    //           onPressed: () {
    //             authController.signOut();
    //           },
    //           child: const Text(
    //             "Log Out",
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    final bool isMobile = MediaQuery.of(context).size.width <
        600; // Adjust the breakpoint as needed

    return AppBar(
      title: const Text('Your App Title'),
      actions: <Widget>[
        if (isMobile)
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Add a drawer or some other mobile-specific navigation here
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        if (!isMobile)
          Row(
            children: [
              NavItem(text: 'Home', onPressed: () => print('Home Pressed')),
              NavItem(text: 'About', onPressed: () => print('About Pressed')),
              // NavItem(
              //     text: 'Contact', onPressed: () => print('Contact Pressed')),
              const LogoutButton(),
            ],
          ),
      ],
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  NavItem({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
