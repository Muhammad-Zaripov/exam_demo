enum AuthStatus { initial, loading, authenticated, unauthenticated, failure, success }


class AuthState {
  final String email;
  final String password;
  final AuthStatus status;
  final String? errorMessage;

  AuthState({
    required this.email,
    required this.password,
    this.status = AuthStatus.initial,
    this.errorMessage,
  });

  AuthState copyWith({
    String? email,
    String? password,
    AuthStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
