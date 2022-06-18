// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StartAppbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    const minSize = 0.0;

    final p1Diff = ((size.height - minSize)).truncate();
    final midddleDiff = ((size.height - minSize) * 0.7).truncate();
    path.lineTo(-20, size.height - p1Diff);
    final cp1 = Offset(size.width * 0.3, size.height);
    final ep1 = Offset(size.width * 0.6, size.height - midddleDiff);
    path.quadraticBezierTo(cp1.dx, cp1.dy, ep1.dx, ep1.dy);

    final p2 = ((minSize - size.height) * 0.3).truncate().abs();
    path.lineTo(size.width * 0.6, size.height - midddleDiff);
    final cp2 = Offset(size.width * 0.8, minSize - p2);
    final ep2 = Offset(size.width, size.height);
    path.quadraticBezierTo(cp2.dx, cp2.dy, ep2.dx, ep2.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(StartAppbarClipper oldClipper) => oldClipper != this;
}
