import '../../entities/entities.dart';
import '../../features/fifa/entities/entities.dart';

class WorldRankingDto {
  final Map<String, dynamic> json;

  WorldRankingDto(this.json);

  List<WorldRanking> toEntities() {
    var rankings = <WorldRanking>[];
    if (json['data'] != null && json['data'] is List) {
      for (final item in json['data']) {
        rankings.add(WorldRanking(
          country: Team(
            id: item['countryId']?.toString() ?? '',
            name: item['国家/地区']?.toString() ?? '',
            logoUrl: item['球队图标']?.toString() ?? '',
          ),
          ranking: item['世界排名']?.toString() ?? '',
          rankingChange: item['排名变化']?.toString() ?? '',
          points: item['积分情况']?.toString() ?? '',
          pointsChange: item['积分变化']?.toString() ?? '',
        ));
      }
    }
    return rankings;
  }
}
