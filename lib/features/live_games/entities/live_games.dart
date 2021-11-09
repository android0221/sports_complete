import 'package:equatable/equatable.dart';

import '../../../entities/entities.dart';
import 'entities.dart';

class LiveGames extends Equatable {
  final String date;
  final List<Game> games;

  const LiveGames({
    required this.date,
    required this.games,
  });

  List<Game> get important => games.where((e) => e.isImportant).toList();
  List<Game> get football =>
      important.where((e) => e.type == GameType.football).toList();
  List<Game> get basketball =>
      important.where((e) => e.type == GameType.basketball).toList();
  List<Game> get game =>
      important.where((e) => e.type == GameType.game).toList();

  @override
  List<Object?> get props => [date, games];
}

class Game extends Equatable {
  final String time;
  final Team guest;
  final Team home;
  final bool isImportant;
  final GameType type;
  final String title;

  const Game({
    required this.time,
    required this.guest,
    required this.home,
    required this.isImportant,
    required this.type,
    required this.title,
  });

  @override
  List<Object?> get props => [
        time,
        guest,
        home,
        isImportant,
        type,
        title,
      ];
}
