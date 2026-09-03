

class Room {
  final String roomcode;
  final String name;
  final bool ispublic;
  final String tokentoverifyjoin;

  Room({
    required this.roomcode,
    required this.name,
    required this.ispublic,
    required this.tokentoverifyjoin,
  });

  Map<String, dynamic> toJson() {
    return {
      'roomcode': roomcode,
      'ispublic': ispublic,
      'tokentoverifyjoin': tokentoverifyjoin,
      'name': name,
    };
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomcode: json['roomcode'] as String,
      name: json['name'] as String,
      ispublic: json['ispublic'] as bool,
      tokentoverifyjoin: json['tokentoverifyjoin'] as String,
    );
  }
}


abstract class Lastroomjoineddatadomain {
  void joinNewRoom(Room data);
  void existRoom();
}

