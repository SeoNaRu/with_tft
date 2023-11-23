import 'package:equatable/equatable.dart';
import 'package:with_tft/login/model/tire_model.dart';
import 'package:with_tft/login/model/user_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class LoginState extends Equatable {
  final AuthenticationStatus status;
  final User user;
  final Tier tier;

  const LoginState({
    required this.status,
    required this.user,
    required this.tier,
  });

  factory LoginState.init() {
    return const LoginState(
      status: AuthenticationStatus.unknown,
      user: User.empty,
      tier: Tier.empty,
    );
  }

  @override
  String toString() {
    return 'LoginState{status: $status, user: $user , tier: $tier}';
  }

  @override
  List<Object?> get props => [status, user, tier];

  LoginState copyWith({
    AuthenticationStatus? status,
    User? user,
    Tier? tier,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      tier: tier ?? this.tier,
    );
  }
}
