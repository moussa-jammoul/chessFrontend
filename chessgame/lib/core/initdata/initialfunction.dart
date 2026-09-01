import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:chessgame/features/RandomRoomFlushed/service/flushroomservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Initialfunction extends Notifier<void> {
  @override
  void build() {
  }

  Future<void> runInitEngine() async{
    await initFlushedRooms();
  }
  
  Future<void> initFlushedRooms() async {
     ref.read(flushedRoomsDataProvider);
     await ref.read(flushedRoomsServiceProvider.notifier).loadRooms();
  }

}

final initialfunctionprovider = NotifierProvider<Initialfunction , void>((){
  return Initialfunction();
});