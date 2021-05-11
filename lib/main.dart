import 'package:catalog_app/src/views/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: AppWrapper(),
    ),
  );
}
