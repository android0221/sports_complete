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

  LiveGames copyWith({
    String? date,
    List<Game>? games,
  }) {
    return LiveGames(
      date: date ?? this.date,
      games: games ?? this.games,
    );
  }
}

class Game extends Equatable {
  final String id;
  final String time;
  final Team guest;
  final Team home;
  final bool isImportant;
  final GameType type;
  final String title;
  final GameStatus status;
  final GameScore? score;

  const Game({
    required this.id,
    required this.time,
    required this.guest,
    required this.home,
    required this.isImportant,
    required this.type,
    required this.title,
    required this.status,
    this.score,
  });

  @override
  List<Object?> get props => [
        id,
        time,
        guest,
        home,
        isImportant,
        type,
        title,
        status,
        score,
      ];

  Game copyWith({
    String? id,
    String? time,
    Team? guest,
    Team? home,
    bool? isImportant,
    GameType? type,
    String? title,
    GameStatus? status,
    GameScore? score,
  }) {
    return Game(
      id: id ?? this.id,
      time: time ?? this.time,
      guest: guest ?? this.guest,
      home: home ?? this.home,
      isImportant: isImportant ?? this.isImportant,
      type: type ?? this.type,
      title: title ?? this.title,
      status: status ?? this.status,
      score: score ?? this.score,
    );
  }
}
