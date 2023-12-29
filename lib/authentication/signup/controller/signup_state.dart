part of 'signup_controller.dart';

class SignUpState extends Equatable {
  final Name name;
  final Email email;
  final Password password;
  final bool isValid;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const SignUpState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  SignUpState copyWith({
    Name? name,
    Email? email,
    Password? password,
    // FormzSubmissionStatus? status,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    bool? isLoading,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
