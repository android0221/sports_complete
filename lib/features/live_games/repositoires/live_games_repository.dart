import '../../../services/server_api.dart';
import '../entities/entities.dart';

class LiveGamesRepository {
  final ServerApi serverApi;

  const LiveGamesRepository({required this.serverApi});

  Future<List<LiveGames>> fetchGames() async {
    final dtos = await serverApi.fetchLiveGames();
    return dtos.map((e) => e.toEntity()).toList();
  }
}
