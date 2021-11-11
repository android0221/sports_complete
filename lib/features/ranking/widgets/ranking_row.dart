import 'package:flutter/material.dart';

import '../../../widgets/data_grid/data_grid.dart';
import '../entities/entities.dart';

class RankingRow extends StatelessWidget {
  final int index;
  final Ranking ranking;
  final bool hasDifference;

  const RankingRow({
    Key? key,
    required this.index,
    required this.ranking,
    required this.hasDifference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridRow(
      index: index,
      children: [
        GridTextCell(ranking.ranking),
        GridLogoCell(
          flex: 2,
          text: ranking.team.name,
          logoUrl: ranking.team.logoUrl,
          logoFirst: true,
        ),
        GridTextCell('${ranking.wins}/${ranking.loses}'),
        GridTextCell(ranking.winRate),
        if (hasDifference) GridTextCell(ranking.difference),
        GridTextCell(ranking.recent),
      ],
    );
  }
}
