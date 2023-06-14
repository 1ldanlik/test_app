import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.dart';

part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<_ChangeTheme>(_changeTheme);
  }

  void _changeTheme(_, Emitter emit) {
    final theme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    emit(theme);
  }
}
