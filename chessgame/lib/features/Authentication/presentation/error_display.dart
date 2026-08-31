
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorDisplay extends Notifier<String?> {
  
  @override
  String? build() {
    return null;
  }

  void addError(String err){
    state = err;
  }

  void clearError(){
    state = null;
  }

}

final errorDisplayProvider = NotifierProvider<ErrorDisplay, String?>((){
  return ErrorDisplay();
});