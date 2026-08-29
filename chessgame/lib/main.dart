// ignore_for_file: unused_import

import 'package:chessgame/materialsmanagment.dart';
import 'package:chessgame/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main(){
    runApp(
        ProviderScope(
            child: ChessApp()
        )
    );
}

class ChessApp extends ConsumerWidget{
  const ChessApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
        title: 'Chess',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig:router ,
    );
  
  }
}


