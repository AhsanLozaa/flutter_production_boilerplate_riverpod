part of 'signin_controller.dart';

class SignInState extends Equatable {
  final Email email;
  final Password password;
  // final bool status;
  final bool isValid;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    // this.status = false,
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  SignInState copyWith({
    Email? email,
    Password? password,
    bool? isValid,
    FormzSubmissionStatus? status,
    String? errorMessage,
    bool? isLoading,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      // status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
