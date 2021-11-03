part of 'world_ranking_cubit.dart';

abstract class WorldRankingState extends Equatable {
  const WorldRankingState();

  @override
  List<Object> get props => [];
}

class WorldRankingInitial extends WorldRankingState {}

class WorldRankingLoadInProgress extends WorldRankingState {}

class WorldRankingLoadSucess extends WorldRankingState {
  final List<WorldRanking> rankings;

  const WorldRankingLoadSucess(this.rankings);

  @override
  List<Object> get props => [rankings];
}

class WorldRankingLoadFailure extends WorldRankingState {
  final String message;

  const WorldRankingLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
