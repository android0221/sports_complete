import 'package:equatable/equatable.dart';

import 'entities.dart';

class GroupedRankings extends Equatable {
  final String title;
  final List<Ranking> rankings;

  const GroupedRankings({
    required this.title,
    required this.rankings,
  });

  bool get hasDifference => rankings.any((e) => e.difference.isNotEmpty);

  @override
  List<Object?> get props => [title, rankings];
}
