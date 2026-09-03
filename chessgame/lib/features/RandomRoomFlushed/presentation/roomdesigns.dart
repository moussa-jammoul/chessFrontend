// ignore_for_file: deprecated_member_use, prefer_function_declarations_over_variables, unused_local_variable, unnecessary_string_interpolations

import 'package:chessgame/core/loadingOverlay/loadingOverlayManagment.dart';
import 'package:chessgame/features/RandomRoomFlushed/presentation/flushedroomsdomain.dart';
import 'package:chessgame/features/joinRoom/service/roomjoinservicedomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomTile extends ConsumerStatefulWidget {
  const RoomTile({super.key, required this.roomData});
  final RoomsFormat roomData;

  @override
  ConsumerState<RoomTile> createState() => _RoomTileState();
}

class _RoomTileState extends ConsumerState<RoomTile> {
  final _joinCodeController = TextEditingController();

  @override
  void dispose() {
    _joinCodeController.dispose();
    super.dispose();
  }

  void _joinRoom(BuildContext context) {
    if (widget.roomData.isPublic) {
      Future<void> Function() f = () =>
          ref.read(roomjoinserviceProvider.notifier).joinRoom(widget.roomData.code, null);
      ref.read(loadingOverlayProvider.notifier).passAfunctionToshowLoading(f, context);
    } else {
      showDialog(
        context: context,
        barrierColor: const Color.fromARGB(110, 0, 0, 0),
        builder: (dialogContext) {
          final isDark = Theme.of(dialogContext).brightness == Brightness.dark;
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(dialogContext).size.width - 40,
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                      blurRadius: 4,
                    )
                  ],
                  gradient: LinearGradient(
                    colors: isDark
                        ? [Colors.grey[900]!, Colors.grey[800]!]
                        : [Colors.grey[200]!, Colors.grey[100]!],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        
                        controller: _joinCodeController,
                        style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Room password',
                          hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.black45),
                          border: InputBorder.none,
                          disabledBorder: OutlineInputBorder(               
                         borderRadius: BorderRadius.circular(12),
                         ),
                         enabledBorder: OutlineInputBorder(               
                         borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide(color: Colors.transparent)
                         ),
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        final password = _joinCodeController.text;
                        Navigator.of(dialogContext).pop();

                        Future<void> Function() f = () => ref
                            .read(roomjoinserviceProvider.notifier)
                            .joinRoom(widget.roomData.code, password);
                        ref.read(loadingOverlayProvider.notifier).passAfunctionToshowLoading(f, context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 110, 110, 110),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Join',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.roomData.name,
                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  'code : ${widget.roomData.code}',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 2),
                widget.roomData.isPublic
                    ? const Text('Public', style: TextStyle(color: Colors.green))
                    : const Text('Private', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _joinRoom(context),
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
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: const Center(child: Text('Join', style: TextStyle(color: Colors.black))),
            ),
          ),
        ],
      ),
    );
  }
}