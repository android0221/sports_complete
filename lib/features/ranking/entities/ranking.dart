import 'package:equatable/equatable.dart';

import '../../../entities/entities.dart';

class Ranking extends Equatable {
  final String ranking;
  final Team team;
  final String wins;
  final String loses;
  final String winRate;
  final String difference;
  final String recent;

  const Ranking({
    required this.ranking,
    required this.team,
    required this.wins,
    required this.loses,
    required this.winRate,
    required this.difference,
    required this.recent,
  });

  @override
  List<Object?> get props => [
        ranking,
        team,
        wins,
        loses,
        winRate,
        difference,
        recent,
      ];
}
