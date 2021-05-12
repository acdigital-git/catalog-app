import 'package:catalog_app/core/providers/catalog_providers.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:catalog_app/src/shared/components/loading_widget.dart';
import 'package:catalog_app/src/views/catalog/components/products_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsListView extends HookWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productsFuture = useProvider(fakeCatalogApi);
    return _productsFuture.when(
      data: (_products) => ListView.separated(
        addAutomaticKeepAlives: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return Material(
            borderRadius: BorderRadius.circular(6.0),
            clipBehavior: Clip.antiAlias,
            color: AppStyles.mediumGrey,
            child: ProductsListTile(
              product: _products[index],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      ),
      loading: () => LoadingWidget(),
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
    );
  }
}
