part of 'ranking_cubit.dart';

abstract class RankingState extends Equatable {
  const RankingState();

  @override
  List<Object> get props => [];
}

class RankingInitial extends RankingState {}

class RankingLoadInProgress extends RankingState {}

class RankingLoadSuccess extends RankingState {
  final List<GroupedRankings> groups;

  const RankingLoadSuccess(this.groups);

  bool get hasDifference => groups.any((e) => e.hasDifference);

  @override
  List<Object> get props => [groups];
}

class RankingLoadFailure extends RankingState {
  final String message;

  const RankingLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
