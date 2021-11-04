import 'package:sports_complete/features/schedule/entities/schedule.dart';
import 'package:sports_complete/services/server_api.dart';

class ScheduleRepository {
  final ServerApi serverApi;

  const ScheduleRepository({required this.serverApi});

  Future<Schedules> fetchSchedules({required String apiUrl}) async {
    final dto = await serverApi.fetchSchedules(apiUrl: apiUrl);
    return dto.toEntity();
  }
}
