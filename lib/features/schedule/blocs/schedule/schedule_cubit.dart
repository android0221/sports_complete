import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/schedule.dart';
import '../../repositories/schedule_repository.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepository repository;
  final String apiUrl;

  ScheduleCubit({required this.repository, required this.apiUrl})
      : super(ScheduleInitial());

  Future<void> fetch() async {
    emit(ScheduleLoadInProgress());

    try {
      final schedules = await repository.fetchSchedules(apiUrl: apiUrl);
      emit(ScheduleLoadSuccess(schedules));
    } on ApiException catch (e) {
      emit(ScheduleLoadFailure(e.message));
    }
  }
}
