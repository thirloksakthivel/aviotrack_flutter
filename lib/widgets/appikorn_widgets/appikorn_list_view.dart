import 'package:flutter/material.dart';

class appikorn_list_view extends StatelessWidget {
  const appikorn_list_view({required this.child, required this.count, this.controller, this.reversed});

  final child;
  final int count;
  final ScrollController? controller;
  final bool? reversed;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      reverse: reversed ?? false,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, position) => Container(
              child: child(index: position),
            ),
            childCount: count,
          ),
        ),
      ],
    );
  }
}
