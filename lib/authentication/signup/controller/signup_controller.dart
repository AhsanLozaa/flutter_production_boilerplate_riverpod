import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repository/auth_repo_provider.dart';

part 'signup_state.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) => SignUpController(ref.watch(authRepoProvider)),
);

class SignUpController extends StateNotifier<SignUpState> {
  final AuthenticationRepository _authenticationRepository;
  SignUpController(this._authenticationRepository) : super(const SignUpState());

  // SignUpController() : super(const SignUpState());

  void onNameChange(String value) {
    final name = Name.dirty(value);
    state = state.copyWith(
      name: name,
      isValid: Formz.validate(
        [
          name,
          state.email,
          state.password,
        ],
      ),
      status: FormzSubmissionStatus.initial,
    );
  }

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      isValid: Formz.validate(
        [
          state.name,
          email,
          state.password,
        ],
      ),
      // status: FormzSubmissionStatus.inProgress,
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);

    print(Formz.validate(
      [
        state.name,
        state.password,
        password,
      ],
    ));

    state = state.copyWith(
      password: password,
      isValid: Formz.validate(
        [
          state.name,
          state.email,
          password,
        ],
      ),
      // status: FormzSubmissionStatus.inProgress,
    );
  }

  void signUpWithEmailAndPassword() async {
    if (!state.isValid) {
      return;
    }

    state = state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      isLoading: true,
      errorMessage: "",
    );
    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      state = state.copyWith(
          status: FormzSubmissionStatus.success, isLoading: false);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.code,
          isLoading: false);
    }
  }
}
