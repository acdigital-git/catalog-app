import 'package:catalog_app/src/constants/app_icons.dart';
import 'package:catalog_app/src/views/catalog/components/products_filters_button.dart';
import 'package:catalog_app/src/views/catalog/components/products_listview.dart';
import 'package:catalog_app/src/views/catalog/components/shopping_bag.dart';
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
          leading: Icon(
            AppIcons.shop,
            size: AppIcons.mediumSize,
          ),
          title: Text(_title),
          actions: [
            ShoppingBag(),
            ProductsFiltersBtn(),
          ],
        ),
        body: Container(
          width: double.infinity,
          child: ProductsListView(),
        ),
      ),
    );
  }
}
