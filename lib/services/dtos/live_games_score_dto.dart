import '../../features/live_games/entities/entities.dart';

class LiveGamesScoreDto {
  String? code;
  String? second;
  List<_Score> list;
  String? adCode;

  LiveGamesScoreDto({this.code, this.second, required this.list, this.adCode});

  factory LiveGamesScoreDto.fromJson(Map<String, dynamic> json) {
    return LiveGamesScoreDto(
      code: json['code'] as String?,
      second: json['second'] as String?,
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => _Score.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      adCode: json['ad_code'] as String?,
    );
  }
}

class _Score {
  String? id;
  String? sdate;
  String? time;
  String? url;
  String? type;
  String? start;
  String? homeTeam;
  String? visitTeam;
  String? homeScore;
  String? visitScore;
  String? periodCn;
  String? from;
  String? code;
  String? update;
  String? bigScore1;
  String? bigScore2;
  List<dynamic>? header;
  int? definiteTime;
  String? definiteChar;

  _Score({
    this.id,
    this.sdate,
    this.time,
    this.url,
    this.type,
    this.start,
    this.homeTeam,
    this.visitTeam,
    this.homeScore,
    this.visitScore,
    this.periodCn,
    this.from,
    this.code,
    this.update,
    this.bigScore1,
    this.bigScore2,
    this.header,
    this.definiteTime,
    this.definiteChar,
  });

  factory _Score.fromJson(Map<String, dynamic> json) => _Score(
        id: json['id'] as String?,
        sdate: json['sdate'] as String?,
        time: json['time'] as String?,
        url: json['url'] as String?,
        type: json['type'] as String?,
        start: json['start'] as String?,
        homeTeam: json['home_team'] as String?,
        visitTeam: json['visit_team'] as String?,
        homeScore: json['home_score'] as String?,
        visitScore: json['visit_score'] as String?,
        periodCn: json['period_cn'] as String?,
        from: json['from'] as String?,
        code: json['code'] as String?,
        update: json['update'] as String?,
        bigScore1: json['big_score_1'] as String?,
        bigScore2: json['big_score_2'] as String?,
        header: json['header'] as List<dynamic>?,
        definiteTime: json['definite_time'] as int?,
        definiteChar: json['definite_char'] as String?,
      );

  GameStatus toStatus() {
    if (periodCn == '完赛') {
      return GameStatus.finished;
    }
    if (periodCn == null || periodCn!.isEmpty) {
      return GameStatus.notStarted;
    }
    if (periodCn!.isNotEmpty) {
      return GameStatus.inTheRace;
    }
    return GameStatus.unknown;
  }

  GameScore get toScore => GameScore(
        desc: periodCn ?? '',
        score: '$homeScore - $visitScore',
      );
}
