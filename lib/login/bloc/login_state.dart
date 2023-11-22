import 'package:equatable/equatable.dart';
import 'package:with_tft/login/model/user_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class LoginState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const LoginState({
    required this.status,
    required this.user,
  });

  factory LoginState.init() {
    return const LoginState(
      status: AuthenticationStatus.unknown,
      user: User.empty,
    );
  }

  @override
  String toString() {
    return 'LoginState{status: $status, user: $user}';
  }

  @override
  List<Object?> get props => [status, user];

  LoginState copyWith({
    AuthenticationStatus? status,
    User? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
