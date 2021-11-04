import 'package:equatable/equatable.dart';

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
  final String guestId;
  final String guestName;
  final String guestLogoUrl;
  final String homeId;
  final String homeName;
  final String homeLogoUrl;
  final String score;
  final String? type;

  const Game({
    required this.time,
    required this.guestId,
    required this.guestName,
    required this.guestLogoUrl,
    required this.homeId,
    required this.homeName,
    required this.homeLogoUrl,
    required this.score,
    required this.type,
  });

  @override
  List<Object?> get props => [
        time,
        guestId,
        guestName,
        guestLogoUrl,
        homeId,
        homeName,
        homeLogoUrl,
        score,
        type,
      ];
}
