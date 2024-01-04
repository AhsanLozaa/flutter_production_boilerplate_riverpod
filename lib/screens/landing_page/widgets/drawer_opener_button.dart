import 'package:flutter/material.dart';

class DrawerOpenerButton extends StatelessWidget {
  const DrawerOpenerButton({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //   onPressed: () => scaffoldKey.currentState!.openDrawer(),
    //   icon: const Icon(Icons.person_outline),
    // );
    return GestureDetector(
      onTap: () => scaffoldKey.currentState!.openDrawer(),
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: const CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(
              'https://avatar.iran.liara.run/public/boy?username=Ash'),
          // 'https://gravatar.com/avatar/ec069b4533e02c6febb704fff13ad9df?s=400&d=robohash&r=x'),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
