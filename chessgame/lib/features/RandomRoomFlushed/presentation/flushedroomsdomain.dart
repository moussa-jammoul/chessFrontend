import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FlushedroomsdomainForData {
  void refreshData(List<RoomsFormat> newdata);
}

final flushedRoomsDataProvider =
    NotifierProvider<Flushedroomsdata, List<RoomsFormat>?>(() {
  return Flushedroomsdata();
});

class RoomsFormat {
  final String name;
  final String code;
  final bool isPublic;

  RoomsFormat({
    required this.name,
    required this.code,
    required this.isPublic,
    
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'isPublic': isPublic,
      
    };
  }

  factory RoomsFormat.fromJson(Map<String, dynamic> json) {
    return RoomsFormat(
      name: json['name'] as String,
      code: json['code'] as String,
      isPublic: json['isPublic'] as bool,
      
    );
  }
}