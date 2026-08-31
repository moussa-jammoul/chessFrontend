// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'authdataDomain.dart';


class Authdata extends Notifier<AuthDataFormat?> implements Authdatadomain {

  final secureStorage = FlutterSecureStorage();
  
  @override
  AuthDataFormat? build() {
    return null;
  }

  Future<void> initialize() async {
    final hasToken = await checkIfJWTexist();
    if (!hasToken) {
      state = null;
      return;
    }

    final jwtTokens = await loadAuthTokens();
    state = jwtTokens;
  }

  @override
  Future<bool> checkIfJWTexist() async {
    bool hasToken = await secureStorage.containsKey(key: 'auth_token');
    return hasToken;
    
  }

  @override
  Future<AuthDataFormat?> loadAuthTokens() async {
    String? jsonJWTformat = await secureStorage.read(key: 'auth_token');
    if(jsonJWTformat != null){
      final decodeData = jsonDecode(jsonJWTformat) as Map<String , dynamic>;
      AuthDataFormat data = AuthDataFormat.fromJson(decodeData);
      return data;
    }
    return null;
    
  }

  @override
  Future<void> writeNewTokens(String jwtacces, String jwtrefresh) async {
    final dataToStore = AuthDataFormat(jwtAcess: jwtacces, jwtRefresh: jwtrefresh);

    await secureStorage.write(key: 'auth_token', value: jsonEncode(dataToStore.toJson()));
    state = dataToStore;
    
  }

  @override
  Future<void> deleteTokens() async {
    state = null;
    await secureStorage.delete(key: 'auth_token');
    
  }
}

