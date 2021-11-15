import '../../features/news/entities/entities.dart';

class NewsDto {
  String? model;
  String? type;
  String? title;
  String? label;
  String? thumbnail;
  String? createtime;
  String? matchId;
  String? tag;
  bool? disableBlack;
  String? mediaUserAvatar;
  String? mediaUserName;
  int? mediaUserId;
  String? mediaAuthInfo;
  String? mediaShowV;
  String? wtoutiaoDesc;
  String? articleType;
  dynamic bestComment;
  String? pinglun;
  String? url;
  String? versionUrl;

  NewsDto({
    this.model,
    this.type,
    this.title,
    this.label,
    this.thumbnail,
    this.createtime,
    this.matchId,
    this.tag,
    this.disableBlack,
    this.mediaUserAvatar,
    this.mediaUserName,
    this.mediaUserId,
    this.mediaAuthInfo,
    this.mediaShowV,
    this.wtoutiaoDesc,
    this.articleType,
    this.bestComment,
    this.pinglun,
    this.url,
    this.versionUrl,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => NewsDto(
        model: json['model'] as String?,
        type: json['type'] as String?,
        title: json['title'] as String?,
        label: json['label'] as String?,
        thumbnail: json['thumbnail'] as String?,
        createtime: json['createtime'] as String?,
        matchId: json['match_id']?.toString(),
        tag: json['tag'] as String?,
        disableBlack: json['disable_black'] as bool?,
        mediaUserAvatar: json['media_user_avatar'] as String?,
        mediaUserName: json['media_user_name'] as String?,
        mediaUserId: json['media_user_id'] as int?,
        mediaAuthInfo: json['media_auth_info'] as String?,
        mediaShowV: json['media_show_v'] as String?,
        wtoutiaoDesc: json['wtoutiao_desc'] as String?,
        articleType: json['article_type'] as String?,
        bestComment: json['best_comment'] as dynamic,
        pinglun: json['pinglun'] as String?,
        url: json['url'] as String?,
        versionUrl: json['version_url'] as String?,
      );

  News toEntity() {
    return News(
      title: title ?? '',
      url: 'https://m.zhibo8.cc/news/web$url',
      imageUrl: thumbnail ?? '',
      isTop: tag == '置顶',
      dateTime: _dateTime,
    );
  }

  DateTime? get _dateTime {
    if (createtime == null || createtime!.isEmpty) {
      return null;
    }
    return DateTime.tryParse(createtime!);
  }
}
