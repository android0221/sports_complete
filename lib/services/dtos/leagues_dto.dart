import 'package:sports_complete/features/data/entities/entities.dart';

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
            .where((e) => e.type != 'other')
            .toList(),
        important: json['important'] as int?,
        clearCache: json['clear_cache'] as int?,
        showTabs: json['show_tabs'] as Map<String, dynamic>?,
      );

  List<League> toLeagues() {
    return league?.map((e) {
          return League(
            name: e.name ?? '',
            logoUrl: _logo(e.name),
            tabTypes: e.list?.map((e) => e.toEntity()).toList() ?? [],
          );
        }).toList() ??
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
  List<TabDto>? list;

  LeagueDto({
    this.name,
    this.label,
    this.defaultP,
    this.type,
    this.creatTime,
    this.position,
    this.yearListInner,
    this.list,
  });

  factory LeagueDto.fromJson(Map<String, dynamic> json) => LeagueDto(
        name: json['name'] as String?,
        label: json['label'] as String?,
        defaultP: json['default_p'] as int?,
        type: json['type'] as String?,
        creatTime: json['creat_time'] as int?,
        position: json['position'] as int?,
        yearListInner: json['year_list_inner'] as bool?,
        list: (json['list'] as List).map((e) => TabDto.fromJson(e)).toList(),
      );
}

class TabDto {
  String? name;
  String? url;

  TabDto({
    this.name,
    this.url,
  });

  factory TabDto.fromJson(Map<String, dynamic> json) => TabDto(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  TabType toEntity() {
    return TabType(name: name ?? '', apiUrl: url ?? '');
  }
}
