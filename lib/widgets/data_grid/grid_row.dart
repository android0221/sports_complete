import 'package:flutter/material.dart';

class GridRow extends StatelessWidget {
  final List<Widget> children;
  final int index;

  const GridRow({
    Key? key,
    required this.index,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index.isEven ? Colors.transparent : Theme.of(context).dividerColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: children),
    );
  }
}
