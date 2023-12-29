import 'package:flutter/cupertino.dart';

class TopShape extends CustomClipper<Path> {
  static Widget draw() {
    return ClipPath(
      clipper: TopShape(),
    );
  }

  @override
  Path getClip(Size size) {
    final path = Path();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
