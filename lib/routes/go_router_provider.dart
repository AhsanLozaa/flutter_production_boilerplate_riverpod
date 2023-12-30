// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../authentication/authentication_view.dart';
import '../authentication/controller/authentication_controller.dart';
import '../authentication/forgot_password/forgot_password.dart';
import '../screens/error/route_error_screen.dart';
import '../screens/home/home_screen.dart';
import 'named_routes.dart';

final Provider<GoRouter> goRouterProvider =
    Provider<GoRouter>((ProviderRef<GoRouter> ref) {
  final AuthenticationState authenticationState = ref.watch(authProvider);

  String getInitialRoute() {
    if (authenticationState.status == AuthenticationStatus.authenticated) {
      return '/';
    } else if (authenticationState.status ==
        AuthenticationStatus.unauthenticated) {
      return '/auth';
    }

    return '/auth';
  }

  return GoRouter(
    // initialLocation: "/auth",
    initialLocation: getInitialRoute(),
    routes: <RouteBase>[
      GoRoute(
        path: '/auth',
        name: auth,
        builder: (BuildContext context, GoRouterState state) =>
            AuthenticationView(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/forgot_password',
        name: forgotPassword,
        builder: (BuildContext context, GoRouterState state) =>
            ForgotPasswordScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/',
        name: root,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(
          key: state.pageKey,
        ),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) {
      return RouterErrorScreen(
        errorMessage: state.error!.message.toString(),
        key: state.pageKey,
      );
    },
  );
});
