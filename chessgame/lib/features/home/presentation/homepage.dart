// ignore_for_file: deprecated_member_use, unused_element, unused_import, prefer_function_declarations_over_variables

import 'dart:ui';

import 'package:chessgame/core/loadingOverlay/loadingOverlayManagment.dart';
import 'package:chessgame/features/Authentication/service/authentication_service_domain.dart';
import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:chessgame/features/RandomRoomFlushed/presentation/roomdesigns.dart';
import 'package:chessgame/features/RandomRoomFlushed/service/flushroomservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';


class Homepage extends ConsumerWidget {
  const Homepage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
     
      appBar: _GlassAppBar(),
       floatingActionButton: 
       SizedBox(

        width: MediaQuery.of(context).size.width - 30,
        child: Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(59, 255, 255, 255),
        offset: Offset(0, 2),
        spreadRadius: 1,
        blurRadius: 5,
      )
    ],
    gradient: const LinearGradient(
      colors: [Color.fromARGB(255, 49, 156, 67), Color.fromARGB(255, 87, 215, 100)],
    ),
  ),
  child: FloatingActionButton.extended(
    onPressed: () {
      //TODO : open join/create room
    },
    backgroundColor: Colors.transparent,
    elevation: 0,
    
    label: const Text("Play", style: TextStyle(color: Colors.white)),
    splashColor: const Color.fromARGB(104, 209, 255, 207), 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
    ),   
  ),
)
       
       ),
    
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: 
      Stack(
         fit: StackFit.expand,
        children: [
          Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                  ? const [
                      Color(0xFF0D0F0D), // near-black, faint green undertone
                      Color.fromARGB(255, 73, 73, 73),
                    ]
                  : const [
                      Color(0xFFF4F6F4), // soft off-white
                      Color(0xFFE7ECE8),
                    ],
            ),
          ),
        );
      },
    ),
           ColorFiltered(
  colorFilter: const ColorFilter.matrix(<double>[ // color filter to make the lottie between black-white
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1, 0,
  ]),
  child:Lottie.asset(
  'assets/lotties/Starrybackground.json',
  fit: BoxFit.contain,
  repeat: true,      
  animate: true,       
),
),
      Positioned.fill(child: Container(color: const Color.fromARGB(62, 0, 0, 0),)),
      Consumer(builder:(context, ref, child) {
        final data = ref.watch(flushedRoomsDataProvider);
        if (data != null) {
        return SafeArea(
        top: false,
        bottom: false,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, kToolbarHeight + 60, 10, 96),
          itemCount: data.length,
          itemBuilder: (context, index) {
            
            return RoomTile(roomData: data[index]);
          },
        ),
      );
        }
        return Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
              ),
            ),
            Container(
  width: 92,
  height: 92,
  alignment: Alignment.center, // <- also center it inside the circle
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Theme.of(context).colorScheme.primary.withOpacity(0.18),
        Theme.of(context).colorScheme.primary.withOpacity(0.05),
      ],
    ),
    border: Border.all(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
      width: 1,
    ),
  ),
  child: Image.asset(
    'assets/images/chess-chesscom.png',
    width: 44,
    height: 44,
    fit: BoxFit.contain,
  ),
)
          ],
        ),
        const SizedBox(height: 28),
        Text(
          'No rooms yet',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'It\'s quiet here. Open rooms will\nappear the moment someone starts one.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
        ),
      ],
    ),
  ),
);
        
      }
      ,)
        ]
      )
      

    );

  }

}





class _GlassAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _GlassAppBar();
  
  void refreshnewRooms(WidgetRef ref , BuildContext context){
     Future<void> Function() f = () => ref.read(flushedRoomsServiceProvider.notifier).loadRooms();
     ref.read(loadingOverlayProvider.notifier).passAfunctionToshowLoading(f, context);
  }
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AppBar(
          backgroundColor: isDark ? const Color.fromARGB(240, 22, 22, 22).withOpacity(0.55) :
          const Color.fromARGB(238, 255, 255, 255).withOpacity(0.25)
          ,
          elevation: 1,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          //centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
  width: 40,
  height: 40,
  padding: const EdgeInsets.all(3), // border thickness
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    gradient: const LinearGradient(
      colors: [Color.fromARGB(255, 224, 224, 224), Color.fromARGB(255, 90, 90, 90)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white, // inner background
      borderRadius: BorderRadius.circular(3), // slightly smaller radius
    ),
    child: const Icon(
      Icons.person,
     
      color: Color.fromARGB(255, 86, 86, 86),
    ),
  ),
),
              Image.asset(
                'assets/images/chesscomlogo.png',
                scale: 15,
              ),
              IconButton(
                onPressed: (){
                  refreshnewRooms(ref, context);          
                } , 
              icon: Icon(
                Icons.refresh,
                color: Theme.of(context).colorScheme.onSurface ,
              )
              )
            ],
          ),
        ),
      ),
    );
  }
 
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}