import 'package:chessgame/features/UserData/service/current_user_data_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentUserData extends Notifier<Userdata?> implements CurrentUserDataDomain {

  @override
  Userdata? build() {
    return null;

  }
  
  @override
  void setNewData(Userdata newData){
    state = newData;
  }
  
  @override
  void removeMemoryCachedData(){
    state = null;
  }

}

final currentUserDataProvider = NotifierProvider<CurrentUserData , void>((){
  return CurrentUserData();
});