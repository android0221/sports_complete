import 'package:equatable/equatable.dart';

class WorldRanking extends Equatable {
  final String ranking;
  final String countryId;
  final String countryName;
  final String rankingChange;
  final String logoUrl;
  final String points;
  final String pointsChange;

  const WorldRanking({
    required this.ranking,
    required this.countryId,
    required this.countryName,
    required this.rankingChange,
    required this.logoUrl,
    required this.points,
    required this.pointsChange,
  });

  @override
  List<Object?> get props => [
        ranking,
        countryId,
        countryName,
        rankingChange,
        logoUrl,
        points,
        pointsChange,
      ];
}
