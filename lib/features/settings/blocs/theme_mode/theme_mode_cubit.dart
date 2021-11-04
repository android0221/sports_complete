import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.system);

  void toggleSystemMode() => emit(
        state == ThemeMode.system ? ThemeMode.light : ThemeMode.system,
      );

  void changeTo(ThemeMode mode) => emit(mode);
}
