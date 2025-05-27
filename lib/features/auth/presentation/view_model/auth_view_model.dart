// import 'package:flutter/foundation.dart';
// import 'package:hotel/features/auth/data/model/auth_model.dart';
// import 'package:hotel/features/auth/data/usecases/auth_service%20.dart';
// import 'package:hotel/features/auth/data/usecases/auth_repositories.dart';

// class AuthViewModel extends ChangeNotifier {
//   final AuthService _authService = AuthService();
//   final AuthRepositories _authRepo = AuthRepositories();

//   Future<void> register(AuthModel model) async {
//     final token = await _authService.register(email: model.email, password: model.password);
//     await _authRepo.saveToken(token);
//     notifyListeners();

//   }

//   Future<void> login(AuthModel model) async {
//     final token = await _authService.login(email: model.email, password: model.password);
//     await _authRepo.saveToken(token);
//     notifyListeners();

//   }

//   Future<void> logout() async {
//     await _authService.logout();
//     await _authRepo.removeToken();
//     notifyListeners();
//   }
// }
