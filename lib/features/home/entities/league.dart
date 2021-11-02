import 'package:equatable/equatable.dart';

class League extends Equatable {
  final String name;
  final String? logoUrl;

  const League({required this.name, required this.logoUrl});

  @override
  List<Object?> get props => [name, logoUrl];
}
