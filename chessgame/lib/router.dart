import 'package:chessgame/features/Authentication/presentation/loginpage.dart';
import 'package:go_router/go_router.dart';
// ignore_for_file: unused_import

GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) =>Loginpage() ,
    ),
  ]
);