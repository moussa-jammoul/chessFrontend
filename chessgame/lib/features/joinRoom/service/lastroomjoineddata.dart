// ignore_for_file: avoid_print

import 'package:chessgame/features/joinRoom/service/lastroomjoineddatadomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Lastroomjoineddata extends Notifier<Room?> implements Lastroomjoineddatadomain {
  @override
  Room? build() {
    return null;
    
  }

  @override
  void existRoom() {
    state = null;
  }

  @override
  void joinNewRoom(Room data) {
    state = data;
    print("joined room with : ${data.name} , ${data.roomcode} , ${data.tokentoverifyjoin}");
  }

}

final lastroomjoineddataProvider = NotifierProvider<Lastroomjoineddata , Room?>((){
  return Lastroomjoineddata();
});