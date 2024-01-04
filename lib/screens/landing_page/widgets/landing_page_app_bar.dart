import 'package:flutter/material.dart';

import 'drawer_opener_button.dart';

class LandingPageAppBar extends PreferredSize {
  const LandingPageAppBar(
      {super.key,
      required this.scaffoldKey,
      required super.preferredSize,
      required super.child});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.infinite,
      child: AppBar(
        leading: DrawerOpenerButton(
          scaffoldKey: scaffoldKey,
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        actions: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.settings_outlined,
            ),
          )
        ],
      ),
    );
  }
}
