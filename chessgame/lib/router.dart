import 'package:chessgame/features/Authentication/presentation/authdata.dart';
import 'package:chessgame/features/Authentication/presentation/authdataDomain.dart';
import 'package:chessgame/features/Authentication/presentation/loginpage.dart';
import 'package:chessgame/features/home/presentation/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// ignore_for_file: unused_import

final routerProvider = Provider<GoRouter>((ref){
  ref.read(authdataprovider.notifier).initialize(); //init auth data
  final refreshNotifier = GoRouterRefreshNotifier(ref);


  return GoRouter(
  initialLocation: '/home',
  refreshListenable: refreshNotifier,
  redirect: (context, state) {
     final authToken = ref.read(authdataprovider);
      final loggedIn = authToken != null;
      final loggingIn = state.matchedLocation == '/login';

      if (!loggedIn && !loggingIn) return '/login';  
      if (loggedIn && loggingIn) return '/home'; 
      return null;
  },

  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) =>Loginpage() ,
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Homepage(),
    )
  ]
);

});



class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Ref ref) {
    ref.listen(authdataprovider, (_,_) => notifyListeners());
  }
}