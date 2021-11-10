import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/entities.dart';
import '../../repositoires/live_games_repository.dart';

part 'live_games_state.dart';

class LiveGamesCubit extends Cubit<LiveGamesState> {
  final LiveGamesRepository repository;

  LiveGamesCubit({required this.repository}) : super(LiveGamesInitial()) {
    Timer.periodic(const Duration(seconds: 10), (_) => updateScore());
  }

  Future<void> fetchGames() async {
    emit(LiveGamesLoadInProgress());

    try {
      final games = await repository.fetchGames();
      emit(LiveGamesLoadSuccess(games));
    } on ApiException catch (e) {
      emit(LiveGamesLoadFailure(e.message));
    }
  }

  Future<void> updateScore() async {
    if (state is! LiveGamesLoadSuccess) {
      return;
    }

    final liveGames = (state as LiveGamesLoadSuccess).games;
    try {
      final updated = await repository.updateScore(liveGames: liveGames);
      emit(LiveGamesLoadSuccess(updated));
    } catch (_) {}
  }
}
