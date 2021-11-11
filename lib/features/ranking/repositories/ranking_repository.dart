import '../../../services/server_api.dart';
import '../entities/entities.dart';

class RankingRepository {
  final ServerApi serverApi;

  RankingRepository({required this.serverApi});

  Future<List<GroupedRankings>> fetchRankings({required String apiUrl}) async {
    final dtos = await serverApi.fetchRanking(apiUrl: apiUrl);
    return dtos.toEntities();
  }
}
