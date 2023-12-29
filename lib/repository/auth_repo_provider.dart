import 'package:authentication_repository/authentication_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepoProvider = Provider<AuthenticationRepository>(
  (_) => AuthenticationRepository(),
);
