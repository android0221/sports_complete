import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String url;
  final String imageUrl;
  final bool isTop;
  final String dateTime;

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
