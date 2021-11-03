import 'package:sports_complete/features/fifa/entities/entities.dart';
import 'package:sports_complete/services/server_api.dart';

class FifaRepository {
  final ServerApi serverApi;

  const FifaRepository({required this.serverApi});

  Future<List<WorldRanking>> fetchRanking(Gender gender) async {
    final dto = await serverApi.fetchWorldRanking(gender);
    return dto.toEntities();
  }
}
