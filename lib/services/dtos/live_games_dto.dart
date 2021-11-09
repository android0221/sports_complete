import '../../entities/entities.dart';
import '../../features/live_games/entities/entities.dart';

class LiveGamesDto {
  String? formatDate;
  String? date;
  List<_LiveGameDto>? list;
  String? code;

  LiveGamesDto({this.formatDate, this.date, this.list, this.code});

  factory LiveGamesDto.fromJson(Map<String, dynamic> json) => LiveGamesDto(
        formatDate: json['formatDate'] as String?,
        date: json['date'] as String?,
        list: (json['list'] as List<dynamic>?)
            ?.map((e) => _LiveGameDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        code: json['code'] as String?,
      );

  LiveGames toEntity() {
    return LiveGames(
      date: date ?? '',
      games: list?.map((e) => e._toEntity()).toList() ?? [],
    );
  }
}

class _LiveGameDto {
  String? id;
  String? sdate;
  String? stime;
  String? time;
  String? totalScoreH;
  String? totalScoreV;
  String? title;
  String? content;
  String? url;
  List<dynamic>? tvs;
  String? keywords;
  String? pinglun;
  String? type;
  String? label;
  _LeagueDto? league;
  String? guess;
  String? beanOrder;
  String? pushStatus;
  bool? disableBlack;
  String? homeTeam;
  String? visitTeam;
  String? homeLogo;
  String? visitLogo;
  String? start;
  String? startTime;
  _TeamDto? leftTeam;
  _TeamDto? rightTeam;
  String? model;
  String? leagueId;
  bool? showLiveIcon;
  _MatchStatusDto? matchStatus;

  _LiveGameDto({
    this.id,
    this.sdate,
    this.stime,
    this.time,
    this.totalScoreH,
    this.totalScoreV,
    this.title,
    this.content,
    this.url,
    this.tvs,
    this.keywords,
    this.pinglun,
    this.type,
    this.label,
    this.league,
    this.guess,
    this.beanOrder,
    this.pushStatus,
    this.disableBlack,
    this.homeTeam,
    this.visitTeam,
    this.homeLogo,
    this.visitLogo,
    this.start,
    this.startTime,
    this.leftTeam,
    this.rightTeam,
    this.model,
    this.leagueId,
    this.showLiveIcon,
    this.matchStatus,
  });

  factory _LiveGameDto.fromJson(Map<String, dynamic> json) => _LiveGameDto(
        id: json['id'] as String?,
        sdate: json['sdate'] as String?,
        stime: json['stime'] as String?,
        time: json['time'] as String?,
        totalScoreH: json['total_score_h'] as String?,
        totalScoreV: json['total_score_v'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        url: json['url'] as String?,
        tvs: json['tvs'] as List<dynamic>?,
        keywords: json['keywords'] as String?,
        pinglun: json['pinglun'] as String?,
        type: json['type'] as String?,
        label: json['label'] as String?,
        league: json['league'] == null
            ? null
            : _LeagueDto.fromJson(json['league'] as Map<String, dynamic>),
        guess: json['guess'] as String?,
        beanOrder: json['bean_order'] as String?,
        pushStatus: json['push_status'] as String?,
        disableBlack: json['disable_black'] as bool?,
        homeTeam: json['home_team'] as String?,
        visitTeam: json['visit_team'] as String?,
        homeLogo: json['home_logo'] as String?,
        visitLogo: json['visit_logo'] as String?,
        start: json['start'] as String?,
        startTime: json['start_time'] as String?,
        leftTeam: json['left_team'] == null
            ? null
            : _TeamDto.fromJson(json['left_team'] as Map<String, dynamic>),
        rightTeam: json['right_team'] == null
            ? null
            : _TeamDto.fromJson(json['right_team'] as Map<String, dynamic>),
        model: json['model'] as String?,
        leagueId: json['league_id'] as String?,
        showLiveIcon: json['show_live_icon'] as bool?,
        matchStatus: json['match_status'] == null
            ? null
            : _MatchStatusDto.fromJson(
                json['match_status'] as Map<String, dynamic>),
      );

  Game _toEntity() {
    return Game(
      time: stime ?? '',
      guest: _toTeam('visit'),
      home: _toTeam('home'),
      isImportant: content?.contains('<b>') ?? false,
      type: _type,
      title: title?.replaceAll(RegExp(r'<.>'), '').split(' ').first ?? '',
    );
  }

  GameType get _type {
    switch (type) {
      case 'football':
        return GameType.football;
      case 'basketball':
        return GameType.basketball;
      case 'game':
        return GameType.game;
      default:
        return GameType.other;
    }
  }

  Team _toTeam(String identity) {
    if (leftTeam?.identity == identity) {
      return Team(
        id: leftTeam?.teamid ?? '',
        name: leftTeam?.name ?? '',
        logoUrl: _teamLogoUrl(leftTeam?.logo),
      );
    }
    return Team(
      id: rightTeam?.teamid ?? '',
      name: rightTeam?.name ?? '',
      logoUrl: _teamLogoUrl(rightTeam?.logo),
    );
  }

  String _teamLogoUrl(String? url) {
    if (url == null || url.isEmpty) {
      return '';
    }
    var type = 'zuqiu';
    switch (_type) {
      case GameType.basketball:
        type = 'nba';
        break;
      case GameType.game:
        type = 'game';
        break;
      default:
        type = 'zuqiu';
    }
    return 'https://duihui.qiumibao.com/$type/$url.png';
  }
}

class _MatchStatusDto {
  String? type;
  String? name;

  _MatchStatusDto({this.type, this.name});

  factory _MatchStatusDto.fromJson(Map<String, dynamic> json) =>
      _MatchStatusDto(
        type: json['type'] as String?,
        name: json['name'] as String?,
      );
}

class _LeagueDto {
  String? nameCn;
  String? name;

  _LeagueDto({this.nameCn, this.name});

  factory _LeagueDto.fromJson(Map<String, dynamic> json) => _LeagueDto(
        nameCn: json['name_cn'] as String?,
        name: json['name'] as String?,
      );
}

class _TeamDto {
  String? identity;
  String? name;
  String? logo;
  String? teamid;

  _TeamDto({this.identity, this.name, this.logo, this.teamid});

  factory _TeamDto.fromJson(Map<String, dynamic> json) => _TeamDto(
        identity: json['identity'] as String?,
        name: json['name'] as String?,
        logo: json['logo'] as String?,
        teamid: json['teamid'] as String?,
      );
}
