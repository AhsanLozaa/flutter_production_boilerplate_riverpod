import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/auth_repo_provider.dart';

part 'authentication_state.dart';

final StateNotifierProvider<AuthController, AuthenticationState> authProvider =
    StateNotifierProvider<AuthController, AuthenticationState>(
  (StateNotifierProviderRef<AuthController, AuthenticationState> ref) =>
      AuthController(
    ref.watch(authRepoProvider),
  ),
);

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  // late final StreamSubscription _streamSubscription;

  //
  AuthController(this._authenticationRepository)
      : super(const AuthenticationState.unauthenticated()) {
    _authenticationRepository.user
        .listen((AuthUser user) => _onUserChanged(user));
  }

  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticated();
    } else {
      state = AuthenticationState.authenticated(user);
    }
  }

  void signOut() {
    _authenticationRepository.signOut();
  }

  @override
  void dispose() {
    // _streamSubscription.cancel();
    super.dispose();
  }
}
