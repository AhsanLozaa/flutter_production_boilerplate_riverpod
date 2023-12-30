import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../authentication/controller/authentication_controller.dart';
import '../../widgets/responsive_layout_widget/responsive_layout_widget.dart';
import 'logout_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthenticationState authenticationState = ref.read(authProvider);

    final AuthController authController = ref.read(authProvider.notifier);
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

    // return AppBar(
    //   title: Text("Home Screen"),
    //   actions: [
    //     IconButton(
    //         onPressed: () {
    //           print("fsdfs");
    //         },
    //         icon: Icon(Icons.home_outlined))
    //   ],
    // );

    // return ResponsiveLayoutWidget(
    //   mobile: Text("sdfsfs"),
    // );

    int _currentIndex = 0;

    // Pages for each tab
    final List<Widget> _pages = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
    ];

    return ResponsiveLayoutWidget(
      mobile: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome - Mobile'),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 6),
              child: const Icon(
                Icons.dark_mode,
              ),
            ),
          ],
        ),
        // bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // onTap: (int value) {
          //   print(value);
          // },
          onTap: (int index) => {},
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );

    // return ResponsiveLayoutWidget(
    //   mobile: AppBar(
    //     title: Text("Welcome - Mobile"),
    //     actions: [IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))],

    //   ),
    // );

    return AppBar(
      title: const Text('Welcome'),
      actions: <Widget>[
        if (!isMobile)
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.abc),
              onPressed: () {
                // Add a drawer or some other mobile-specific navigation here
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        if (isMobile)
          Row(
            children: <Widget>[
              NavItem(text: 'Home', onPressed: () => print("Home Pressed")),
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
  const NavItem({super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;

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
