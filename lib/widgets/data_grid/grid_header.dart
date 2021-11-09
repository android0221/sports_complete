import 'package:flutter/material.dart';

import 'data_grid.dart';

class GridHeader extends StatelessWidget {
  final List<String> titles;

  const GridHeader({Key? key, required this.titles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: titles.map((e) => GridTextCell(e)).toList(),
      ),
    );
  }
}
