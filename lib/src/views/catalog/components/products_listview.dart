import 'package:catalog_app/core/providers/catalog_providers.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:catalog_app/src/shared/components/loading_widget.dart';
import 'package:catalog_app/src/views/catalog/components/products_animated_icon.dart';
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
            child: ListTile(
              key: ValueKey(_products[index].id),
              leading: CircleAvatar(
                backgroundColor: _products[index].color,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(_products[index].label),
              ),
              subtitle: Text(
                _products[index].price.toString() + ' \$',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: ProductsAnimatedIcon(
                product: _products[index],
              ),
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
