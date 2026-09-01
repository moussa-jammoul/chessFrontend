// ignore_for_file: unnecessary_string_interpolations

import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomTile extends ConsumerWidget {
  const RoomTile({super.key, required this.roomData});
  final RoomsFormat roomData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.surfaceContainerHigh,
            isDark ? const Color.fromARGB(255, 57, 57, 57) : const Color.fromARGB(255, 245, 245, 245),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/standardboard.png',
              width: 85,
              height: 85,
            )
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${roomData.name}',
                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  'code : ${roomData.code}',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 2),
                roomData.isPublic ? Text(
                  'Public',
                  style: TextStyle(color: Colors.green),
                ) : Text(
                  'Private',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: join room — network call goes here (business logic layer)
            },
            
            child: Container(
              width: 55,
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 86, 163, 89),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(25, 255, 255, 255),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Center( child:Text('Join' , style: TextStyle(color: Colors.black),)),
            ),
          ),
        ],
      ),
    );
  }
}