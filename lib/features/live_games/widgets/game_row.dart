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
            child: Text(
              game.title,
              textAlign: TextAlign.center,
            ),
          ),
          _TeamInfo(game.guest),
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
