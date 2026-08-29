

// ignore_for_file: file_names

import 'package:chessgame/features/Authentication/presentation/authdata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthDataFormat {
  String jwtAcess;
  String jwtRefresh;
  AuthDataFormat({required this.jwtAcess , required this.jwtRefresh});

  Map<String, dynamic> toJson() {
    return {
      'jwtacces' : jwtAcess,
      'jwtrefresh' : jwtRefresh
    };
  }

  factory AuthDataFormat.fromJson(Map<String, dynamic> json){
    return AuthDataFormat(jwtAcess: json['jwtacces'], jwtRefresh: json['jwtrefresh']);
  }
}


abstract class Authdatadomain {
  Future<AuthDataFormat?> loadAuthTokens();
  Future<void> writeNewTokens(String jwtacces , String jwtRefresh);
  Future<bool> checkIfJWTexist();
  Future<void> deleteTokens();
}

final authdataprovider = NotifierProvider<Authdata , AuthDataFormat?>((){
  return Authdata();
});