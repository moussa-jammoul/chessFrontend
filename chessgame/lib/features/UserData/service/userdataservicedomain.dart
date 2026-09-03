// ignore_for_file: unused_element

import 'package:chessgame/features/UserData/service/userdataservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Userdataservicedomain {
  Future<void> getUserData();
  Future<void> clearUserDataLocally();
}

final userdataserviceProvider = NotifierProvider<Userdataservice,void>((){
  return Userdataservice();
});