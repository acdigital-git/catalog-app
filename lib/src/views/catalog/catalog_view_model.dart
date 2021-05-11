import 'package:catalog_app/src/constants/app_routes.dart';
import 'package:catalog_app/src/views/catalog/components/products_listview.dart';
import 'package:flutter/material.dart';

class CatalogViewModel extends StatelessWidget {
  const CatalogViewModel({Key? key, required String title})
      : _title = title,
        super(key: key);
  final String _title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.store_rounded),
          title: Text(_title),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
            )
          ],
        ),
        body: ProductsListView(),
      ),
    );
  }
}
