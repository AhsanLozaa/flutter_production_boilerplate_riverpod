import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/authentication_view.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/forgot_password/forgot_password.dart';
import 'package:flutter_production_boilerplate_riverpod/screens/error/route_error_screen.dart';
import 'package:flutter_production_boilerplate_riverpod/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_production_boilerplate_riverpod/authentication/controller/authentication_controller.dart';
import 'package:flutter_production_boilerplate_riverpod/routes/named_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authenticationState = ref.watch(authProvider);

  String getInitialRoute() {
    if (authenticationState.status == AuthenticationStatus.authenticated) {
      return "/";
    } else if (authenticationState.status ==
        AuthenticationStatus.unauthenticated) {
      return "/auth";
    }

    return "/auth";
  }

  return GoRouter(
    // initialLocation: "/auth",
    initialLocation: getInitialRoute(),
    routes: [
      GoRoute(
        path: "/auth",
        name: auth,
        builder: (context, state) => AuthenticationView(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: "/forgot_password",
        name: forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: "/",
        name: root,
        builder: (context, state) => HomeScreen(
          key: state.pageKey,
        ),
      ),
    ],
    errorBuilder: (context, state) {
      return RouterErrorScreen(
        errorMessage: state.error!.message.toString(),
        key: state.pageKey,
      );
    },
  );
});
