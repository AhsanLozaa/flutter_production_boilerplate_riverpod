part of 'authentication_controller.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  // default constructor
  const AuthenticationState._(
      {required this.status, this.user = AuthUser.empty});

  // named constructor
  const AuthenticationState.authenticated(AuthUser user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  // named constructor
  const AuthenticationState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );
  final AuthenticationStatus status;
  final AuthUser user;

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}
