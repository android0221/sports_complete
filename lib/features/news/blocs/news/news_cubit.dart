import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../entities/api_exception.dart';
import '../../entities/entities.dart';
import '../../repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repository;

  NewsCubit({required this.repository}) : super(NewsInitial());

  Future<void> fetch() async {
    emit(NewsLoadInProgress());

    await _fetch(
      date: DateTime.now(),
      onSuccess: (newsList) => emit(NewsLoadSuccess(newsList)),
      onFailure: (message) => emit(NewsLoadFailure(message)),
    );
  }

  Future<void> refresh() async {
    if (state is! NewsLoadSuccess) {
      return;
    }

    await _fetch(
      date: DateTime.now(),
      onSuccess: (newsList) => emit(NewsLoadSuccess(newsList)),
      onFailure: (message) {
        final loaded = (state as NewsLoadSuccess).newsList;
        emit(NewsRefreshFailure(newsList: List.from(loaded), message: message));
      },
    );
  }

  Future<void> loadMore() async {
    if (state is! NewsLoadSuccess) {
      return;
    }

    final loaded = (state as NewsLoadSuccess).newsList;
    if (loaded.isEmpty) {
      return;
    }
    final loadDate = loaded.last.dateTime;
    if (loadDate == null) {
      return;
    }

    await _fetch(
      date: loadDate.add(const Duration(days: -1)),
      onSuccess: (newsList) => emit(NewsLoadSuccess(loaded + newsList)),
      onFailure: (message) {
        final loaded = (state as NewsLoadSuccess).newsList;
        emit(NewsRefreshFailure(newsList: List.from(loaded), message: message));
      },
    );
  }

  Future<void> _fetch({
    required DateTime date,
    required ValueChanged onSuccess,
    required ValueChanged onFailure,
  }) async {
    try {
      final newsList = await repository.fetch(date: date);
      onSuccess(newsList);
    } on ApiException catch (e) {
      onFailure(e.message);
    }
  }
}
