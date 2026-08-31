// ignore_for_file: prefer_function_declarations_over_variables

import 'package:chessgame/core/loadingOverlay/loadingOverlayManagment.dart';
import 'package:chessgame/features/Authentication/service/authentication_service_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: IconButton(
      icon: const Icon(Icons.logout),
      tooltip: 'Log out',
      onPressed: () async {
         Future<void> Function() f = () => ref.read(authenticationServiceProvider.notifier).logout();
         await ref.read(loadingOverlayProvider.notifier).passAfunctionToshowLoading(f, context);
         },
    )
      ),
    );
    
  }

}