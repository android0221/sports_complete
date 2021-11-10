import 'package:equatable/equatable.dart';

class GameScore extends Equatable {
  final String desc;
  final String score;

  const GameScore({
    required this.desc,
    required this.score,
  });

  @override
  List<Object?> get props => [desc, score];
}
