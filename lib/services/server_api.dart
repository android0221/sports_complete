import 'package:sports_complete/entities/api_exception.dart';
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

  @override
  onRequestSuccess(data) {
    return data;
  }

  @override
  void onRequestFailed(data) {
    throw ApiException(data.toString());
  }
}
