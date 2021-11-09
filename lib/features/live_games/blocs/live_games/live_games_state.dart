part of 'live_games_cubit.dart';

abstract class LiveGamesState extends Equatable {
  const LiveGamesState();

  @override
  List<Object> get props => [];
}

class LiveGamesInitial extends LiveGamesState {}

class LiveGamesLoadInProgress extends LiveGamesState {}

class LiveGamesLoadSuccess extends LiveGamesState {
  final List<LiveGames> games;

  const LiveGamesLoadSuccess(this.games);

  @override
  List<Object> get props => [games];
}

class LiveGamesLoadFailure extends LiveGamesState {
  final String message;

  const LiveGamesLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
