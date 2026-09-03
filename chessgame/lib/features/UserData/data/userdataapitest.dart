import 'package:chessgame/features/UserData/data/userdatadomain.dart';
import 'package:chessgame/features/UserData/service/current_user_data_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Userdataapitest extends Notifier<void> implements Userdatadomain {
  
  @override
  void build() {
    
  }

  @override
  Future<Userdata> getUserData() async {
    await Future.delayed(Duration(seconds: 1));
    return Userdata(username: "testing name");
  }

}