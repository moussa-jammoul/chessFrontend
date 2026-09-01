import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Flushedroomsdata extends Notifier<List<RoomsFormat>?> implements FlushedroomsdomainForData {

  @override
  List<RoomsFormat>? build() {
    
    return null;
  }
  
  

  @override
  void refreshData(List<RoomsFormat>? newdata){
    state = newdata;
  }

}