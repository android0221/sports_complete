import 'package:flutter/material.dart';
import 'package:sports_complete/features/home/entities/entities.dart';
import 'package:sports_complete/features/league/pages/league_page.dart';

class LeagueItem extends StatelessWidget {
  final League league;

  const LeagueItem(this.league, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LeaguePage(league)),
      ),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(child: _Logo(league.logoUrl)),
            const SizedBox(height: 8),
            Text(
              league.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final String? url;

  const _Logo(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.2;
    if (url != null && url!.isNotEmpty) {
      return Image.network(url!, width: size, fit: BoxFit.contain);
    }
    return FlutterLogo(size: size);
  }
}
