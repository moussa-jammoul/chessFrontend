class Userdata {
  String username;
  Userdata({required this.username});
  Map<String, dynamic> toJson() {
    return {
      'username': username,
    };
  }

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      username: json['username'] as String,
    );
  }
}

abstract class CurrentUserDataDomain {
  void setNewData(Userdata newData);
  void removeMemoryCachedData();
}