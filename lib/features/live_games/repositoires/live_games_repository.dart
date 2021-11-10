import '../../../services/server_api.dart';
import '../entities/entities.dart';

class LiveGamesRepository {
  final ServerApi serverApi;

  const LiveGamesRepository({required this.serverApi});

  Future<List<LiveGames>> fetchGames() async {
    final gameDtos = await serverApi.fetchLiveGames();
    final dailyGames = gameDtos.map((e) => e.toEntity()).toList();

    return await updateScore(liveGames: dailyGames);
  }

  Future<List<LiveGames>> updateScore({
    required List<LiveGames> liveGames,
  }) async {
    final allGames = <Game>[];
    for (final item in liveGames) {
      allGames.addAll(item.games);
    }

    final updatedGames = <Game>[];
    final scoreDtos = await serverApi.fetchLiveGamesScore();
    for (final score in scoreDtos.list) {
      for (final game in allGames) {
        if (score.id == game.id) {
          updatedGames.add(game.copyWith(
            status: score.toStatus(),
            score: score.toScore,
          ));
          break;
        }
      }
    }

    final updatedDailyGames = <LiveGames>[];
    for (final daily in liveGames) {
      final games = <Game>[];
      for (var game in daily.games) {
        for (final updatedGame in updatedGames) {
          if (updatedGame.id == game.id) {
            game = updatedGame;
            break;
          }
        }
        games.add(game);
      }
      updatedDailyGames.add(LiveGames(date: daily.date, games: games));
    }

    return updatedDailyGames;
  }
}
