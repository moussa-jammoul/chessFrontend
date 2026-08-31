import 'package:chessgame/features/Authentication/data/authentication_api_domain.dart';
import 'package:chessgame/features/Authentication/presentation/authdataDomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationApiTests extends Notifier<void> implements AuthenticationApiDomain {
  @override
  void build() {
    
  }

  @override
  Future<AuthDataFormat> createAccount(String username, String password) async {
    await Future.delayed(Duration(milliseconds: 2000));
    return AuthDataFormat(jwtAcess: "oed3ud93ji", jwtRefresh: "skchieji3");
  }

  @override
  Future<void> logout() async {
     await Future.delayed(Duration(milliseconds: 2000));
    
  }

  @override
  Future<AuthDataFormat> signIn(String username, String password)  async{
     await Future.delayed(Duration(milliseconds: 2000));
    return AuthDataFormat(jwtAcess: "oed3ud93ji", jwtRefresh: "skchieji3");
    
  }

  @override
  Future<AuthDataFormat> updatetokens() async{
     await Future.delayed(Duration(milliseconds: 2000));
    return AuthDataFormat(jwtAcess: "o22222293ji", jwtRefresh: "s3333333kchieji3");
   
  }


}

