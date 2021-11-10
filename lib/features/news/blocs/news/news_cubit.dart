import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/entities.dart';
import '../../repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repository;

  NewsCubit({required this.repository}) : super(NewsInitial());

  Future<void> fetch() async {
    emit(NewsLoadInProgress());

    try {
      final newsList = await repository.fetch(date: DateTime.now());
      emit(NewsLoadSuccess(newsList));
    } on ApiException catch (e) {
      emit(NewsLoadFailure(e.message));
    }
  }
}
