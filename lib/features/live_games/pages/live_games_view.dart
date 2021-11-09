import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../entities/entities.dart';
import '../widgets/widgets.dart';

typedef GamesGetter = List<Game> Function(LiveGames);

class LiveGamesView extends StatelessWidget {
  final List<LiveGames> dateGames;
  final GamesGetter gamesGetter;

  const LiveGamesView(
    this.dateGames, {
    Key? key,
    required this.gamesGetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dateGames.length,
      itemBuilder: (_, index) {
        final games = dateGames[index];
        return StickyHeader(
          header: DateTitle(games.date),
          content: ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: gamesGetter(games).length,
            itemBuilder: (_, gameIndex) {
              return GameRow(game: gamesGetter(games)[gameIndex]);
            },
            separatorBuilder: (_, __) => const Divider(),
          ),
        );
      },
    );
  }
}
