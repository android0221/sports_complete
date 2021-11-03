import 'package:flutter/material.dart';
import 'package:sports_complete/features/fifa/widgets/widgets.dart';

class RankingTitle extends StatelessWidget {
  const RankingTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: const [
          TextCell('世界排名'),
          TextCell('国家/地区'),
          TextCell('排名变化'),
          TextCell('积分情况'),
          TextCell('积分变化'),
        ],
      ),
    );
  }
}
