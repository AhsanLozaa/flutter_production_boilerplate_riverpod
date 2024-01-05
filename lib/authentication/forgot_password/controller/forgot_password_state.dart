part of 'forgot_password_controller.dart';

class ForgotPasswordState extends Equatable {
  final Email email;
  // final Password password;
  // // final bool status;
  final bool isValid;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const ForgotPasswordState({
    this.email = const Email.pure(),
    // this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    // this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  ForgotPasswordState copyWith({
    Email? email,
    // Password? password,
    bool? isValid,
    FormzSubmissionStatus? status,
    String? errorMessage,
    // bool? isLoading,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      // password: password ?? this.password,
      // status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
