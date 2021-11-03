import 'package:flutter/material.dart';
import 'package:sports_complete/features/fifa/entities/entities.dart';
import 'package:sports_complete/features/fifa/widgets/widgets.dart';

class RankingRow extends StatelessWidget {
  final WorldRanking ranking;
  final Color backgroundColor;

  const RankingRow(
    this.ranking, {
    Key? key,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          TextCell(ranking.ranking),
          CountryCell(ranking),
          TextCell(ranking.rankingChange),
          TextCell(ranking.points),
          TextCell(ranking.pointsChange),
        ],
      ),
    );
  }
}
