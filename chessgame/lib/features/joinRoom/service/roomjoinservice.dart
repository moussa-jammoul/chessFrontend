import 'package:chessgame/features/joinRoom/data/roomjoinapidomain.dart';
import 'package:chessgame/features/joinRoom/service/lastroomjoineddata.dart';
import 'package:chessgame/features/joinRoom/service/roomjoinservicedomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Roomjoinservice extends Notifier<void> implements Roomjoinservicedomain {
  @override
  void build() {
   
  }

  @override
  Future<void> exitRoom() async {
    final currentRoom = ref.read(lastroomjoineddataProvider);
    if (currentRoom != null) {
      try {
        await ref.read(roomJoinApiProvider.notifier).exitRoom(
              currentRoom.roomcode,
              currentRoom.tokentoverifyjoin,
            );
        ref.read(lastroomjoineddataProvider.notifier).existRoom();
        //TODO : close the connection to the room
      } catch (e) {
        rethrow;
      }
    }
  }

  @override
  Future<void> joinRoom(String roomtargetcode, String? password) async {
    try {
      final data = await ref.read(roomJoinApiProvider.notifier).joinRoom(roomtargetcode, password);
      ref.read(lastroomjoineddataProvider.notifier).joinNewRoom(data);
      //TODO : set up connection to the game room
    } catch (e) {
      rethrow;
    }
  }
  
}