import 'package:chessgame/features/Authentication/data/authentication_api_tests.dart';
import 'package:chessgame/features/Authentication/presentation/authdataDomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthenticationApiDomain {
  Future<AuthDataFormat> signIn(String username , String password);
  Future<AuthDataFormat> createAccount(String username , String password);
  Future<void> logout();
  Future<AuthDataFormat> updatetokens();
}

final authenticationApiProvider = NotifierProvider<AuthenticationApiTests ,void>((){
  return AuthenticationApiTests();
});