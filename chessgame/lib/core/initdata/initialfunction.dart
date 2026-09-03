import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:chessgame/features/RandomRoomFlushed/service/flushroomservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Initialfunction extends Notifier<void> {
  @override
  void build() {
  }

  Future<void> runInitEngine() async{
    await initFlushedRooms();
    await openHiveBoxes();
  }
  
  Future<void> initFlushedRooms() async {
     ref.read(flushedRoomsDataProvider);
     await ref.read(flushedRoomsServiceProvider.notifier).loadRooms();
  }

  Future<void> openHiveBoxes() async{
     await Hive.openBox<String>('userdata');
  }

  //TODO : load user data

}

final initialfunctionprovider = NotifierProvider<Initialfunction , void>((){
  return Initialfunction();
});