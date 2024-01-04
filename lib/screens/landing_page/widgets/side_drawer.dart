import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../authentication/controller/authentication_controller.dart';
import '../../../states/glass_container/notifier.dart';
import '../../../states/reset_providers.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthController authController = ref.read(authProvider.notifier);
    final AuthUser authUser = ref.read(authProvider).user;

    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // const DrawerHeader(
            //   curve: Curves.easeIn,
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text('Drawer Header'),
            // ),
            ListTile(
              title: Text(authUser.email.toString()),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
            TextButton(
                onPressed: () {
                  resetProviders(ref);
                  authController.signOut();
                },
                child: const Text(
                  'Log Out',
                  selectionColor: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
