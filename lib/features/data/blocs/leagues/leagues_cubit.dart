import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sports_complete/entities/api_exception.dart';
import 'package:sports_complete/features/data/entities/entities.dart';
import 'package:sports_complete/features/data/repositories/leagues_repository.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  final LeaguesRepository repository;

  LeaguesCubit({required this.repository}) : super(LeaguesInitial());

  Future<void> fetch() async {
    emit(LeaguesLoadInProgress());

    try {
      final result = await repository.fetchLeagues();
      emit(LeaguesLoadSuccess(result));
    } on ApiException catch (e) {
      emit(LeaguesLoadFailure(e.message));
    }
  }
}
