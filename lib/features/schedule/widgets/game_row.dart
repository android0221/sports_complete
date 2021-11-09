import 'package:flutter/material.dart';

import '../../../widgets/data_grid/data_grid.dart';
import '../entities/schedule.dart';

class GameRow extends StatelessWidget {
  final int index;
  final Game game;
  const GameRow({
    Key? key,
    required this.index,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridRow(
      index: index,
      children: [
        GridTextCell(game.time),
        GridLogoCell(
          text: game.guest.name,
          logoUrl: game.guest.logoUrl,
          logoFirst: false,
        ),
        GridTextCell(game.score),
        GridLogoCell(
          text: game.home.name,
          logoUrl: game.home.logoUrl,
          logoFirst: true,
        ),
        if (game.type != null) GridTextCell(game.type!),
      ],
    );
  }
}
