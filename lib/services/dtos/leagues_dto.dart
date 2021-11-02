import 'package:sports_complete/features/home/entities/entities.dart';

class LeaguesDto {
  List<LeagueDto>? league;
  int? important;
  int? clearCache;
  Map<String, dynamic>? showTabs;

  LeaguesDto({
    this.league,
    this.important,
    this.clearCache,
    this.showTabs,
  });

  factory LeaguesDto.fromJson(Map<String, dynamic> json) => LeaguesDto(
        league: (json['league'] as List<dynamic>?)
            ?.map((e) => LeagueDto.fromJson(e as Map<String, dynamic>))
            .where((e) => e.defaultP != 0)
            .toList(),
        important: json['important'] as int?,
        clearCache: json['clear_cache'] as int?,
        showTabs: json['show_tabs'] as Map<String, dynamic>?,
      );

  List<League> toLeagues() {
    return league
            ?.map((e) => League(name: e.name ?? '', logoUrl: _logo(e.name)))
            .toList() ??
        [];
  }

  String? _logo(String? name) {
    if (showTabs == null || name == null) {
      return null;
    }

    String? logoUrl;
    for (var a in showTabs!.entries) {
      if (a.key == name && a.value is Map) {
        logoUrl = a.value['img'];
        return logoUrl != null ? 'https:$logoUrl' : logoUrl;
      }
    }

    return logoUrl;
  }
}

class LeagueDto {
  String? name;
  String? label;
  int? defaultP;
  String? type;
  int? creatTime;
  int? position;
  bool? yearListInner;

  LeagueDto({
    this.name,
    this.label,
    this.defaultP,
    this.type,
    this.creatTime,
    this.position,
    this.yearListInner,
  });

  factory LeagueDto.fromJson(Map<String, dynamic> json) => LeagueDto(
        name: json['name'] as String?,
        label: json['label'] as String?,
        defaultP: json['default_p'] as int?,
        type: json['type'] as String?,
        creatTime: json['creat_time'] as int?,
        position: json['position'] as int?,
        yearListInner: json['year_list_inner'] as bool?,
      );
}
