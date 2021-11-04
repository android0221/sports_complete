import 'package:sports_complete/entities/api_exception.dart';
import 'package:sports_complete/features/fifa/entities/entities.dart';
import 'package:sports_complete/services/base_api.dart';
import 'package:sports_complete/services/dtos/dtos.dart';
import 'package:sports_complete/services/json_decode_interceptor.dart';

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

  @override
  onRequestSuccess(data) {
    return data;
  }

  @override
  void onRequestFailed(data) {
    throw ApiException(data.toString());
  }
}
