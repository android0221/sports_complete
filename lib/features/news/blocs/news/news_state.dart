part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadInProgress extends NewsState {}

class NewsLoadSuccess extends NewsState {
  final List<News> newsList;
  final _dateTime = DateTime.now();

  NewsLoadSuccess(this.newsList);

  List<News> get topNewsList => newsList.where((e) => e.isTop).toList();
  List<News> get normalNewsList => newsList.where((e) => !e.isTop).toList();

  @override
  List<Object> get props => [newsList, _dateTime];
}

class NewsLoadFailure extends NewsState {
  final String message;

  const NewsLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

class NewsRefreshFailure extends NewsLoadSuccess {
  final String message;

  NewsRefreshFailure({
    required List<News> newsList,
    required this.message,
  }) : super(newsList);

  @override
  List<Object> get props => [newsList, message, _dateTime];
}
