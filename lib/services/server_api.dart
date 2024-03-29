import 'dart:math';

import '../entities/api_exception.dart';
import '../features/fifa/entities/entities.dart';
import 'base_api.dart';
import 'dtos/dtos.dart';
import 'json_decode_interceptor.dart';

class ServerApi extends BaseApi {
  ServerApi() : super(interceptors: [JsonDecodeInterceptor()]);

  Future<LeaguesDto> fetchLeagues() async {
    final result = await get(
      'https://dc.qiumibao.com/shuju/public/index.php',
      parameters: {'_url': '/index/league_v2', '_platform': 'web'},
    );
    return LeaguesDto.fromJson(result as Map<String, dynamic>);
  }

  Future<WorldRankingDto> fetchWorldRanking(Gender gender) async {
    final parameters = {'_url': '/data/index', 'league': 'FIFA'};
    if (gender == Gender.male) {
      parameters['tab'] = 'FIFA男足';
    } else {
      parameters['tab'] = 'FIFA女足';
    }
    final result = await get(
      'https://dc.qiumibao.com/shuju/public/index.php',
      parameters: parameters,
    );
    return WorldRankingDto(result);
  }

  Future<SchedulesDto> fetchSchedules({required String apiUrl}) async {
    final result = await get(apiUrl);
    return SchedulesDto(result);
  }

  Future<List<LiveGamesDto>> fetchLiveGames() async {
    final games = <LiveGamesDto>[];
    final result = await get(
      'https://m.zhibo8.cc/json/zhibo/saishi_v2.htm',
      parameters: {'random': Random().nextDouble()},
    );
    if (result != null && result is List) {
      for (final item in result) {
        games.add(LiveGamesDto.fromJson(item));
      }
    }

    return games;
  }

  Future<LiveGamesScoreDto> fetchLiveGamesScore() async {
    final result = await get('https://bifen4m.qiumibao.com/json/list.htm');
    return LiveGamesScoreDto.fromJson(result);
  }

  Future<List<NewsDto>> fetchNews({required DateTime date}) async {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final news = <NewsDto>[];
    final result = await get(
      'https://m.zhibo8.cc/json/news/gather/${date.year}/$month/${day}_news_v3.htm',
    );
    if (result != null && result is List) {
      for (final item in result) {
        news.add(NewsDto.fromJson(item));
      }
    }
    return news;
  }

  Future<RankingsDto> fetchRanking({required String apiUrl}) async {
    final result = await get(apiUrl);
    return RankingsDto.fromJson(result);
  }

  @override
  onRequestSuccess(data) {
    return data;
  }

  @override
  void onRequestFailed(data) {
    throw ApiException(data.toString());
  }
}
