import 'package:catalog_app/core/models/product.dart';
import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/shared/components/product_listtile.dart';
import 'package:catalog_app/src/views/catalog/components/products_animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsListTile extends HookWidget {
  const ProductsListTile({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final _isSaved = useProvider(isSavedProduct(product));
    void _onPressed() => _isSaved
        ? context.read(cartNotifier.notifier).remove(product)
        : context.read(cartNotifier.notifier).add(product);
    return buildProductListTile(
      callback: _onPressed,
      product: product,
      trailing: ProductsAnimatedIcon(
        product: product,
      ),
    );
  }
}
