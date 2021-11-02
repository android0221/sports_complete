import 'package:equatable/equatable.dart';

class League extends Equatable {
  final String name;
  final String? logoUrl;
  final List<TabType> tabTypes;

  const League({
    required this.name,
    required this.logoUrl,
    required this.tabTypes,
  });

  @override
  List<Object?> get props => [name, logoUrl, tabTypes];
}

class TabType extends Equatable {
  final String name;
  final String apiUrl;

  const TabType({required this.name, required this.apiUrl});

  @override
  List<Object?> get props => [name, apiUrl];
}
