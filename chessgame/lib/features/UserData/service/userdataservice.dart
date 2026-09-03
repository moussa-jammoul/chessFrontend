// ignore_for_file: unused_element

import 'dart:convert';

import 'package:chessgame/features/UserData/data/userdatadomain.dart';
import 'package:chessgame/features/UserData/service/current_user_data.dart';
import 'package:chessgame/features/UserData/service/current_user_data_domain.dart';
import 'package:chessgame/features/UserData/service/userdataservicedomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class Userdataservice extends Notifier<void> implements Userdataservicedomain {

  @override
  void build() {
   
  }
  
  Future<void> _removeCashedData() async {
  final box = Hive.box<String>('userdata');
  await box.delete('user');
  }

  Future<void> _cachData(Userdata data) async {
  final box = Hive.box<String>('userdata');
  await box.put('user', jsonEncode(data.toJson()));
  }

  @override
  Future<void> clearUserDataLocally() async {
    ref.read(currentUserDataProvider.notifier).removeMemoryCachedData();
    _removeCashedData();
    
  }

  @override
  Future<void> getUserData() async {
    final box = Hive.box<String>('userdata');
    late Userdata userdata;
    if(box.containsKey('user')){
      final raw = box.get('user')!;
      userdata = Userdata.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    }
    else{
       Userdata userdata = await ref.read(userdataApiProvider.notifier).getUserData();
       _cachData(userdata);
    }
    ref.read(currentUserDataProvider.notifier).setNewData(userdata);
  }


}

//TODO , add try / catch / rethrow , handling error , and cleaning garbage if function fail and other not