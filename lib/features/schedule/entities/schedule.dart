import 'package:equatable/equatable.dart';

import '../../../entities/entities.dart';

class Schedules extends Equatable {
  final int position;
  final List<Schedule> schedules;
  final bool hasGameType;

  const Schedules({
    required this.position,
    required this.schedules,
    required this.hasGameType,
  });

  @override
  List<Object?> get props => [position, schedules, hasGameType];
}

class Schedule extends Equatable {
  final String date;
  final List<Game> games;

  const Schedule({
    required this.date,
    required this.games,
  });

  @override
  List<Object?> get props => [date, games];
}

class Game extends Equatable {
  final String time;
  final Team guest;
  final Team home;
  final String score;
  final String? type;

  const Game({
    required this.time,
    required this.guest,
    required this.home,
    required this.score,
    required this.type,
  });

  @override
  List<Object?> get props => [time, guest, home, score, type];
}
