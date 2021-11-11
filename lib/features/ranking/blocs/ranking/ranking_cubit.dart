import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/entities.dart';
import '../../repositories/ranking_repository.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  final String apiUrl;
  final RankingRepository repository;

  RankingCubit({required this.apiUrl, required this.repository})
      : super(RankingInitial());

  Future<void> fetch() async {
    emit(RankingLoadInProgress());

    try {
      final groups = await repository.fetchRankings(apiUrl: apiUrl);
      emit(RankingLoadSuccess(groups));
    } on ApiException catch (e) {
      emit(RankingLoadFailure(e.message));
    }
  }
}
