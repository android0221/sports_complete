import 'package:flutter/material.dart';

import 'data_grid.dart';

class GridHeader extends StatelessWidget {
  final List<String> titles;
  final List<int>? flexes;

  const GridHeader({
    Key? key,
    required this.titles,
    this.flexes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: titles
            .asMap()
            .keys
            .map((index) => GridTextCell(
                  titles[index],
                  flex: flexes == null ? 1 : flexes![index],
                ))
            .toList(),
      ),
    );
  }
}
