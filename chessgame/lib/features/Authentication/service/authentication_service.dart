

// ignore_for_file: unused_local_variable, unused_element

import 'package:chessgame/features/Authentication/data/authentication_api_domain.dart';
import 'package:chessgame/features/Authentication/presentation/authdataDomain.dart';
import 'package:chessgame/features/Authentication/service/authentication_service_domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationService extends Notifier<void> implements AuthenticationServiceDomain {

  @override
  void build() {}

  bool _validateInputs(String username, String password) {
    if (username.length < 3 || password.length < 6 || username == "" || password == "") {
      return false;
    }
    return true;
  }

  @override
  Future<void> createAccount(String username, String password) async {
    if (!_validateInputs(username, password)) {
      throw Exception('Username must be at least 3 characters and password at least 6 characters.');
    }
    try{
    AuthDataFormat newAuthdata = await ref.read(authenticationApiProvider.notifier).createAccount(username, password);
    await ref.read(authdataprovider.notifier).writeNewTokens(newAuthdata.jwtAcess, newAuthdata.jwtRefresh);    
    }catch(e){
      debugPrint('$e');
      rethrow;
    } 
  }

  @override
  Future<void> logout() async {
    try{

    await ref.read(authenticationApiProvider.notifier).logout();
    await ref.read(authdataprovider.notifier).deleteTokens();

    } catch(e){
      debugPrint('$e');
      rethrow;
    }
  }

  @override
  Future<void> signIn(String username, String password) async {
    try{

      AuthDataFormat newAuthdata = await ref.read(authenticationApiProvider.notifier).signIn(username, password);
      await ref.read(authdataprovider.notifier).writeNewTokens(newAuthdata.jwtAcess, newAuthdata.jwtRefresh);

    } catch(e){
      debugPrint('$e');
      rethrow;

    }
    
  }

  @override
  Future<void> updatetokens() async {
    try{
      AuthDataFormat newAuthdata = await ref.read(authenticationApiProvider.notifier).updatetokens();
      await ref.read(authdataprovider.notifier).writeNewTokens(newAuthdata.jwtAcess, newAuthdata.jwtRefresh);

    } catch(e){
      debugPrint('$e');
      rethrow;
    }

    
  }
}

