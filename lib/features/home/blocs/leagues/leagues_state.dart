part of 'leagues_cubit.dart';

abstract class LeaguesState extends Equatable {
  const LeaguesState();

  @override
  List<Object> get props => [];
}

class LeaguesInitial extends LeaguesState {}

class LeaguesLoadSuccess extends LeaguesState {
  final List<League> leagues;

  const LeaguesLoadSuccess(this.leagues);

  @override
  List<Object> get props => [leagues];
}

class LeaguesLoadInProgress extends LeaguesState {}

class LeaguesLoadFailure extends LeaguesState {
  final String message;

  const LeaguesLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
