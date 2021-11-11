import '../../entities/team.dart';
import '../../features/ranking/entities/entities.dart';

class RankingsDto {
  String? name;
  String? type;
  List<_GroupedTeams>? data;
  String? nameCn;
  String? typeCn;
  List<dynamic>? items;
  List<_ShowImgDto>? showImg;
  List<_RedirectDto>? redirect;
  List<dynamic>? showTag;
  _ColorDto? color;

  RankingsDto({
    this.name,
    this.type,
    this.data,
    this.nameCn,
    this.typeCn,
    this.items,
    this.showImg,
    this.redirect,
    this.showTag,
    this.color,
  });

  factory RankingsDto.fromJson(Map<String, dynamic> json) => RankingsDto(
        name: json['name'] as String?,
        type: json['type'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => _GroupedTeams.fromJson(e as Map<String, dynamic>))
            .toList(),
        nameCn: json['name_cn'] as String?,
        typeCn: json['type_cn'] as String?,
        items: json['items'] as List<dynamic>?,
        showImg: (json['show_img'] as List<dynamic>?)
            ?.map((e) => _ShowImgDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        redirect: (json['redirect'] as List<dynamic>?)
            ?.map((e) => _RedirectDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        showTag: json['show_tag'] as List<dynamic>?,
        color: json['color'] == null
            ? null
            : _ColorDto.fromJson(json['color'] as Map<String, dynamic>),
      );

  List<GroupedRankings> toEntities() {
    return data?.map((e) => e._toRankings()).toList() ?? [];
  }
}

class _GroupedTeams {
  String? title;
  List<dynamic>? list;

  _GroupedTeams({this.title, this.list});

  factory _GroupedTeams.fromJson(Map<String, dynamic> json) => _GroupedTeams(
        title: json['title'] as String?,
        list: json['list'] as List<dynamic>?,
      );

  GroupedRankings _toRankings() {
    return GroupedRankings(
      title: title ?? '',
      rankings: list?.map((e) {
            return Ranking(
              ranking: e['排名']?.toString() ?? '',
              team: Team(
                id: e['teamId']?.toString() ?? '',
                name: e['球队名称']?.toString() ?? '',
                logoUrl: e['球队图标']?.toString() ?? '',
              ),
              wins: e['胜']?.toString() ?? '',
              loses: e['负']?.toString() ?? '',
              winRate: e['胜率']?.toString() ?? '',
              difference: e['胜差']?.toString() ?? '',
              recent: e['近况']?.toString() ?? '',
            );
          }).toList() ??
          [],
    );
  }
}

class _ShowImgDto {
  String? key;
  String? imgKey;
  String? imgIndex;
  String? position;

  _ShowImgDto({this.key, this.imgKey, this.imgIndex, this.position});

  factory _ShowImgDto.fromJson(Map<String, dynamic> json) => _ShowImgDto(
        key: json['key'] as String?,
        imgKey: json['img_key'] as String?,
        imgIndex: json['img_index'] as String?,
        position: json['position'] as String?,
      );
}

class _RedirectDto {
  String? key;
  String? url;
  List<dynamic>? update;
  String? pcUrl;
  int? isRowAction;

  _RedirectDto({this.key, this.url, this.update, this.pcUrl, this.isRowAction});

  factory _RedirectDto.fromJson(Map<String, dynamic> json) => _RedirectDto(
        key: json['key'] as String?,
        url: json['url'] as String?,
        update: json['update'] as List<dynamic>?,
        pcUrl: json['pc_url'] as String?,
        isRowAction: json['isRowAction'] as int?,
      );
}

class _LineDto {
  bool? show;
  String? value;

  _LineDto({this.show, this.value});

  factory _LineDto.fromJson(Map<String, dynamic> json) => _LineDto(
        show: json['show'] as bool?,
        value: json['value'] as String?,
      );
}

class _ColorDto {
  _LineDto? line;
  String? font;
  String? nightFont;
  String? background;

  _ColorDto({this.line, this.font, this.nightFont, this.background});

  factory _ColorDto.fromJson(Map<String, dynamic> json) => _ColorDto(
        line: json['line'] == null
            ? null
            : _LineDto.fromJson(json['line'] as Map<String, dynamic>),
        font: json['font'] as String?,
        nightFont: json['night_font'] as String?,
        background: json['background'] as String?,
      );
}
