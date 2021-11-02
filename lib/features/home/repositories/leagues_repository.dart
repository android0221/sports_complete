import 'package:sports_complete/features/home/entities/league.dart';
import 'package:sports_complete/services/server_api.dart';

class LeaguesRepository {
  final ServerApi serverApi;

  const LeaguesRepository({required this.serverApi});

  Future<List<League>> fetchLeagues() async {
    final dtos = await serverApi.fetchLeagues();
    return dtos.toLeagues();
  }
}
