import 'package:chessgame/features/joinRoom/service/roomjoinservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Roomjoinservicedomain {
  Future<void> joinRoom(String roomtargetcode , String? password);
  Future<void> exitRoom();
}

final roomjoinserviceProvider = NotifierProvider<Roomjoinservice,void>((){
  return Roomjoinservice();
});