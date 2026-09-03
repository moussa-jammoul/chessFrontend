import 'package:chessgame/features/joinRoom/data/roomjoinapidomain.dart';
import 'package:chessgame/features/joinRoom/service/lastroomjoineddatadomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Roomjointestapi extends Notifier<void> implements Roomjoinapidomain {

  @override
  void build() {}

  @override
  Future<Room> joinRoom(String roomtargetcode , String? password) async {
    await Future.delayed(const Duration(seconds: 2));

    return Room(
      roomcode: roomtargetcode,
      name: 'Test Room',
      ispublic: true,
      tokentoverifyjoin: 'fake-jwt-token-abc123',
    );
  }

  @override
  Future<void> exitRoom(String roomtargetcode , String tokentoverifyjoin) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

