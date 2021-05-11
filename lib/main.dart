import 'package:catalog_app/src/constants/app_globals.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:catalog_app/src/views/cart/cart_view_model.dart';
import 'package:catalog_app/src/views/catalog/catalog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppGlobals.appTitle,
      theme: AppStyles.theme,
      routes: {
        '/': (context) => CatalogViewModel(title: AppGlobals.catalogTitle),
        '/cart': (context) => CartViewModel(title: AppGlobals.cartTitle),
      },
      initialRoute: '/',
    );
  }
}
