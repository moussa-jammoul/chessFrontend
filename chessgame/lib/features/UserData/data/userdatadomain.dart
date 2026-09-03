// ignore_for_file: unused_element

import 'package:chessgame/features/UserData/data/userdataapitest.dart';
import 'package:chessgame/features/UserData/service/current_user_data_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Userdatadomain {
  Future<Userdata> getUserData();
}

final userdataApiProvider = NotifierProvider<Userdataapitest, void>((){
  return Userdataapitest();
});