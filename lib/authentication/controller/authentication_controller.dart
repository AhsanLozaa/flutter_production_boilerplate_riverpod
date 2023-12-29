import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_production_boilerplate_riverpod/repository/auth_repo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'authentication_state.dart';

final authProvider = StateNotifierProvider<AuthController, AuthenticationState>(
  (ref) => AuthController(
    ref.watch(authRepoProvider),
  ),
);

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription _streamSubscription;

  //
  AuthController(this._authenticationRepository)
      : super(const AuthenticationState.unauthenticated()) {
    _authenticationRepository.user.listen((user) => _onUserChanged(user));
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
    _streamSubscription.cancel();
    super.dispose();
  }
}
