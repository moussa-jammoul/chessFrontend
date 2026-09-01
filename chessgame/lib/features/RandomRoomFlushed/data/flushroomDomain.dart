// ignore_for_file: file_names

import 'package:chessgame/features/RandomRoomFlushed/data/flushroomtestapi.dart';
import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Flushroomdomain {
  Future<List<RoomsFormat>?> getNewDataRooms();
}

final flushRoomApiProvider = NotifierProvider<Flushroomtestes, void>(() {
  return Flushroomtestes();
});

