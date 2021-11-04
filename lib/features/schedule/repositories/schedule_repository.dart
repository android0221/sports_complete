import 'package:sports_complete/features/schedule/entities/schedule.dart';
import 'package:sports_complete/services/server_api.dart';

class ScheduleRepository {
  final ServerApi serverApi;

  const ScheduleRepository({required this.serverApi});

  Future<Schedules> fetchSchedules() async {
    final dto = await serverApi.fetchSchedules(leagueName: 'NBA');
    return dto.toEntity();
  }
}
