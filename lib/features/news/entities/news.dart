import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class News extends Equatable {
  final String title;
  final String url;
  final String imageUrl;
  final bool isTop;
  final DateTime? dateTime;

  String get formatDateTime {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('MM-dd HH:mm').format(dateTime!);
  }

  const News({
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.isTop,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [title, url, imageUrl, isTop, dateTime];
}
