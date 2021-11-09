import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/entities.dart';
import '../../repositories/fifa_repository.dart';

part 'world_ranking_state.dart';

class WorldRankingCubit extends Cubit<WorldRankingState> {
  final FifaRepository repository;
  final Gender gender;

  WorldRankingCubit({
    required this.repository,
    required this.gender,
  }) : super(WorldRankingInitial());

  Future<void> fetch() async {
    emit(WorldRankingLoadInProgress());

    try {
      final rankings = await repository.fetchRanking(gender);
      emit(WorldRankingLoadSucess(rankings));
    } on ApiException catch (e) {
      emit(WorldRankingLoadFailure(e.message));
    }
  }
}
