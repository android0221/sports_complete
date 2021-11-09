import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/entities.dart';
import '../../repositoires/live_games_repository.dart';

part 'live_games_state.dart';

class LiveGamesCubit extends Cubit<LiveGamesState> {
  final LiveGamesRepository repository;

  LiveGamesCubit({required this.repository}) : super(LiveGamesInitial());

  Future<void> fetchGames() async {
    emit(LiveGamesLoadInProgress());

    try {
      final games = await repository.fetchGames();
      emit(LiveGamesLoadSuccess(games));
    } on ApiException catch (e) {
      emit(LiveGamesLoadFailure(e.message));
    }
  }
}
