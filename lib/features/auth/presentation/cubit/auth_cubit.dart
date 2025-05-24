import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/auth_model.dart';
import '../../data/usecases/auth_repositories.dart';
import '../../data/usecases/auth_service .dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();
  final AuthRepositories _authRepo = AuthRepositories();

  AuthCubit()
    : super(AuthState(email: '', password: '', status: AuthStatus.initial));

  Future<void> login(AuthModel model) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final token = await _authService.login(
        email: model.email,
        password: model.password,
      );
      await _authRepo.saveToken(token);
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> register(AuthModel model) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final token = await _authService.register(
        email: model.email,
        password: model.password,
      );
      await _authRepo.saveToken(token);
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    await _authService.logout();
    await _authRepo.removeToken();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }
}
