import 'package:catalog_app/src/constants/app_globals.dart';
import 'package:catalog_app/src/constants/app_routes.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:catalog_app/src/views/cart/cart_view_model.dart';
import 'package:catalog_app/src/views/catalog/catalog_view_model.dart';
import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppGlobals.appTitle,
      theme: AppStyles.theme,
      routes: {
        AppRoutes.catalog: (context) =>
            CatalogViewModel(title: AppGlobals.catalogTitle),
        AppRoutes.cart: (context) => CartViewModel(title: AppGlobals.cartTitle),
      },
      initialRoute: '/',
    );
  }
}
