import 'package:equatable/equatable.dart';

import '../../../entities/team.dart';

class WorldRanking extends Equatable {
  final Team country;
  final String ranking;
  final String rankingChange;
  final String points;
  final String pointsChange;

  const WorldRanking({
    required this.country,
    required this.ranking,
    required this.rankingChange,
    required this.points,
    required this.pointsChange,
  });

  @override
  List<Object?> get props => [
        country,
        ranking,
        rankingChange,
        points,
        pointsChange,
      ];
}
