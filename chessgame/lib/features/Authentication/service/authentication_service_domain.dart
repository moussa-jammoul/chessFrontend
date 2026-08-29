import 'package:chessgame/features/Authentication/service/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthenticationServiceDomain {
  Future<void> signIn(String username , String password);
  Future<void> createAccount(String username , String password);
  Future<void> logout();
  Future<void> updatetokens();
}

final authenticationServiceProvider = NotifierProvider<AuthenticationService, void>(() {
  return AuthenticationService();
});