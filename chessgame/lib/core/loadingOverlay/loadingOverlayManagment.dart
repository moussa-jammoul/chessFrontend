// ignore_for_file: unused_field, file_names

import 'package:chessgame/core/loadingOverlay/loadingOverlayDomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class Loadingoverlaymanagment extends Notifier<void> implements Loadingoverlaydomain {

  bool alreadyOverlayed = false;
  OverlayEntry? _overlayEntry;
  
  @override
  void build() {
    
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
     child: Container(
      color: const Color.fromARGB(145, 0, 0, 0),
      child: Center(
        child: 
        
        Lottie.asset(
        'assets/lotties/chessloading.json',
         width: 250,
         height: 250,
         repeat: true,       
         animate: true,       
        )
      )
      ),     
    ),
    );
    
  }

  @override
  void removeLoadingOverlay() {
     _overlayEntry?.remove();
     alreadyOverlayed = false;
  }

  @override
  void showLoadingOverlay(BuildContext context) {
    if(!alreadyOverlayed){
    Overlay.of(context).insert(_overlayEntry!);
    alreadyOverlayed = true;
    }
  }

  @override
  Future<void> passAfunctionToshowLoading(Function f , BuildContext context) async {
    showLoadingOverlay(context);
    try {
    await f();
    } finally {
    removeLoadingOverlay();
    }
  }

}


final loadingOverlayProvider = NotifierProvider<Loadingoverlaymanagment , void>((){
  return Loadingoverlaymanagment();
});