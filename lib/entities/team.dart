import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final String id;
  final String name;
  final String logoUrl;

  const Team({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  @override
  List<Object?> get props => [id, name, logoUrl];
}
