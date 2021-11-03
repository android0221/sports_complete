import 'package:flutter/material.dart';
import 'package:sports_complete/features/fifa/entities/entities.dart';

class CountryCell extends StatelessWidget {
  final WorldRanking ranking;

  const CountryCell(this.ranking, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(ranking.logoUrl, width: 32, height: 32),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              ranking.countryName,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 13,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
