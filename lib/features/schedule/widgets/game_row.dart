import 'package:flutter/material.dart';
import 'package:sports_complete/features/schedule/entities/schedule.dart';
import 'package:sports_complete/widgets/data_grid/data_grid.dart';

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
          text: game.guestName,
          logoUrl: game.guestLogoUrl,
          logoFirst: false,
        ),
        GridTextCell(game.score),
        GridLogoCell(
          text: game.homeName,
          logoUrl: game.homeLogoUrl,
          logoFirst: true,
        ),
        GridTextCell(game.type),
      ],
    );
  }
}
