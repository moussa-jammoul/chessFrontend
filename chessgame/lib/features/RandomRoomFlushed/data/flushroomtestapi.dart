// ignore_for_file: dead_code

import 'package:chessgame/features/RandomRoomFlushed/data/flushroomDomain.dart';
import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Flushroomtestes extends Notifier<void> implements  Flushroomdomain {
  
  @override
  void build() {
    
  }

  @override
  Future<List<RoomsFormat>?> getNewDataRooms() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      RoomsFormat(name: "play with me", code: "92ui2jndjns", isPublic: true),
      RoomsFormat(name: "night owls", code: "7fk29dksla2", isPublic: true),
RoomsFormat(name: "chess grinders", code: "a83jd82nz9x", isPublic: false),
RoomsFormat(name: "quick blitz", code: "kd82nz93jsl", isPublic: true),
RoomsFormat(name: "friends only", code: "z9x83kd7fna", isPublic: false),
RoomsFormat(name: "casual vibes", code: "m2ld92kfj83", isPublic: true),
RoomsFormat(name: "pro league", code: "9zkd83nals2", isPublic: false),
RoomsFormat(name: "beginners hub", code: "fj83md2lk92", isPublic: true),
RoomsFormat(name: "study group", code: "l92kd8fj3na", isPublic: false),
RoomsFormat(name: "weekend match", code: "nz93kd82jsl", isPublic: true),
    ];


    
  }

}