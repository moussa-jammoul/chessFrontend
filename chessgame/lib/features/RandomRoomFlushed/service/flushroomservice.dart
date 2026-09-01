import 'package:chessgame/features/RandomRoomFlushed/data/flushroomDomain.dart';
import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:chessgame/features/RandomRoomFlushed/service/flushroomservicedomain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlushedRoomsService extends Notifier<void> implements FlushedRoomsServiceDomain {

  @override
  void build() {}

  @override
  Future<void> loadRooms() async {
    try{
    List<RoomsFormat>? newRooms = await ref.read(flushRoomApiProvider.notifier).getNewDataRooms();
    ref.read(flushedRoomsDataProvider.notifier).refreshData(newRooms);
    } catch(e){
      debugPrint('$e');
      rethrow;
    }
  }
}

final flushedRoomsServiceProvider = NotifierProvider<FlushedRoomsService, void>(() {
  return FlushedRoomsService();
});