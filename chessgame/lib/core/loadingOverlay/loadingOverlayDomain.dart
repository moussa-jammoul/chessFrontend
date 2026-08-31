// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class Loadingoverlaydomain {
  void showLoadingOverlay(BuildContext context);
  void removeLoadingOverlay();
  Future<void>passAfunctionToshowLoading(Function f , BuildContext context);
}