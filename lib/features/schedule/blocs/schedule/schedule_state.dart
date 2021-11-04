part of 'schedule_cubit.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoadInProgress extends ScheduleState {}

class ScheduleLoadSuccess extends ScheduleState {
  final Schedules schedules;

  const ScheduleLoadSuccess(this.schedules);

  @override
  List<Object> get props => [schedules];
}

class ScheduleLoadFailure extends ScheduleState {
  final String message;

  const ScheduleLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
