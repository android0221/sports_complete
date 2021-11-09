import '../../../services/server_api.dart';
import '../entities/entities.dart';

class LeaguesRepository {
  final ServerApi serverApi;

  const LeaguesRepository({required this.serverApi});

  Future<List<League>> fetchLeagues() async {
    final dtos = await serverApi.fetchLeagues();
    return dtos.toLeagues();
  }
}
