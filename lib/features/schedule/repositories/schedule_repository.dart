import '../../../services/server_api.dart';
import '../entities/schedule.dart';

class ScheduleRepository {
  final ServerApi serverApi;

  const ScheduleRepository({required this.serverApi});

  Future<Schedules> fetchSchedules({required String apiUrl}) async {
    final dto = await serverApi.fetchSchedules(apiUrl: apiUrl);
    return dto.toEntity();
  }
}
