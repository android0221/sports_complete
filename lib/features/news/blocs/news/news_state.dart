part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadInProgress extends NewsState {}

class NewsLoadSuccess extends NewsState {
  final List<News> _newsList;

  const NewsLoadSuccess(this._newsList);

  List<News> get topNewsList => _newsList.where((e) => e.isTop).toList();
  List<News> get normalNewsList => _newsList.where((e) => !e.isTop).toList();

  @override
  List<Object> get props => [_newsList];
}

class NewsLoadFailure extends NewsState {
  final String message;

  const NewsLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
