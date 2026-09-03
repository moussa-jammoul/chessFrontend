// ignore_for_file: unused_import

import 'package:chessgame/materialsmanagment.dart';
import 'package:chessgame/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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


