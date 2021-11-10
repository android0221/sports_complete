import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../entities/team.dart';
import '../entities/entities.dart';

class GameRow extends StatelessWidget {
  final Game game;

  const GameRow({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(game.time),
          ),
          _TeamInfo(game.home),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(game.score?.score ?? ''),
                Text(
                  game.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          _TeamInfo(game.guest),
          _GameStatus(game),
        ],
      ),
    );
  }
}

class _TeamInfo extends StatelessWidget {
  final Team team;

  const _TeamInfo(this.team, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox.square(
            dimension: MediaQuery.of(context).size.width / 10,
            child: CachedNetworkImage(imageUrl: team.logoUrl),
          ),
          Text(
            team.name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _GameStatus extends StatelessWidget {
  final Game game;

  const _GameStatus(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = '未开始';
    if (game.status == GameStatus.inTheRace ||
        game.status == GameStatus.finished) {
      text = game.score?.desc ?? '';
    }

    return Expanded(child: Text(text, textAlign: TextAlign.center));
  }
}
