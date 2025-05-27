import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false); // false = Light, true = Dark

  void updateTheme(Brightness brightness) {
    emit(brightness == Brightness.dark);
  }
}
