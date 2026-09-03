import 'package:chessgame/features/joinRoom/data/roomjoinapitest.dart';
import 'package:chessgame/features/joinRoom/service/lastroomjoineddatadomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Roomjoinapidomain {
  Future<Room> joinRoom(String roomtargetcode , String? password);
  Future<void> exitRoom(String roomtargetcode ,  String tokentoverifyjoin);
}

final roomJoinApiProvider = NotifierProvider<Roomjointestapi, void>(() {
  return Roomjointestapi();
});