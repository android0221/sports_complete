import '../../entities/entities.dart';
import '../../features/schedule/entities/schedule.dart';

class SchedulesDto {
  final Map<String, dynamic> json;

  SchedulesDto(this.json);

  Schedules toEntity() {
    return Schedules(
      position: json['position'] ?? 0,
      schedules: _toEntities(),
      hasGameType: json['items']?.length == 5,
    );
  }

  List<Schedule> _toEntities() {
    var schedules = <Schedule>[];
    if (json['data'] != null && json['data'] is List) {
      for (final item in json['data']) {
        schedules.add(Schedule(
          date: item['title']?.toString() ?? '',
          games: _toGames(item['list']),
        ));
      }
    }
    return schedules;
  }

  List<Game> _toGames(dynamic gameList) {
    var games = <Game>[];
    if (gameList != null && gameList is List) {
      for (var e in gameList) {
        games.add(_toGame(e));
      }
    }
    return games;
  }

  Game _toGame(Map<String, dynamic> game) {
    return Game(
      time: game['时间'] ?? '',
      guest: Team(
        id: game['guestId'] ?? '',
        name: game['客队'] ?? '',
        logoUrl: game['客队图标'] ?? '',
      ),
      home: Team(
        id: game['homeId'] ?? '',
        name: game['主队'] ?? '',
        logoUrl: game['主队图标'] ?? '',
      ),
      score: game['比分'] ?? '',
      type: game['赛事'] ?? '',
    );
  }
}
