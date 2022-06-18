// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:post_box/graphic/clipers/startClipper.dart';

class SliverStartAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 60,
      child: ClipPath(
        clipper: StartAppbarClipper(),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE0852F), Color(0xFFE6AB75)],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}