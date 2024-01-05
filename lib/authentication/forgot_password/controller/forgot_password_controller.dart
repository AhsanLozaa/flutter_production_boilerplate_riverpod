import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repository/auth_repo_provider.dart';

part 'forgot_password_state.dart';

final AutoDisposeStateNotifierProvider<ForgotPasswordController,
        ForgotPasswordState> forgotPasswordProvider =
    StateNotifierProvider.autoDispose<ForgotPasswordController,
        ForgotPasswordState>((AutoDisposeStateNotifierProviderRef<
                ForgotPasswordController, ForgotPasswordState>
            ref) =>
        ForgotPasswordController(ref.watch(authRepoProvider)));

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordController(this._authenticationRepository)
      : super(const ForgotPasswordState());

  final AuthenticationRepository _authenticationRepository;

  void onEmailChange(String value) {
    final Email email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      isValid: Formz.validate(
        [
          email,
          // state.password,
        ],
      ),
      status: FormzSubmissionStatus.initial,
    );
  }

  Future<void> requestResetPasswordEmail() async {
    if (!state.isValid) {
      return;
    }

    state = state.copyWith(
        status: FormzSubmissionStatus.inProgress, errorMessage: "");

    try {
      await _authenticationRepository.forgotPassword(email: state.email.value);
      state = state.copyWith(status: FormzSubmissionStatus.success);
    } on ForgotPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: e.code);
    }
  }
}
