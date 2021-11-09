import '../../../services/server_api.dart';
import '../entities/entities.dart';

class FifaRepository {
  final ServerApi serverApi;

  const FifaRepository({required this.serverApi});

  Future<List<WorldRanking>> fetchRanking(Gender gender) async {
    final dto = await serverApi.fetchWorldRanking(gender);
    return dto.toEntities();
  }
}
