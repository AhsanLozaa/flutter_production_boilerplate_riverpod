import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repository/auth_repo_provider.dart';

part 'signin_state.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
        (ref) => SignInController(ref.watch(authRepoProvider)));

class SignInController extends StateNotifier<SignInState> {
  SignInController(this._authenticationRepository) : super(const SignInState());
  final AuthenticationRepository _authenticationRepository;

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      isValid: Formz.validate(
        [
          email,
          state.password,
        ],
      ),
      status: FormzSubmissionStatus.initial,
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);

    state = state.copyWith(
      password: password,
      isValid: Formz.validate(
        [
          state.email,
          password,
        ],
      ),
      status: FormzSubmissionStatus.initial,
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    if (!state.isValid) {
      return;
    }

    state = state.copyWith(
        status: FormzSubmissionStatus.inProgress, errorMessage: '');
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      state = state.copyWith(status: FormzSubmissionStatus.success);
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: e.code);
    }
  }
}
