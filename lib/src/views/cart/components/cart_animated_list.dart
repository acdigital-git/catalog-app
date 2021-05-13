import 'package:catalog_app/core/models/product.dart';
import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/constants/app_globals.dart';
import 'package:catalog_app/src/shared/components/product_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:implicitly_animated_list/implicitly_animated_list.dart';

class CartAnimatedList extends HookWidget {
  const CartAnimatedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _products = useProvider(cartNotifier);
    var _index = 0;

    return ImplicitlyAnimatedList(
      padding: const EdgeInsets.all(16.0),
      itemData: _products,
      deleteDuration: AppGlobals.iconAnimDuration,
      itemBuilder: (context, Product product) {
        final _isLastItem = _index++ == _products.length;
        return Padding(
          padding: _isLastItem
              ? const EdgeInsets.all(0)
              : const EdgeInsets.only(bottom: 16.0),
          child: buildProductListTile(
            product: product,
            trailing: IconButton(
              icon: Icon(Icons.clear_rounded),
              splashRadius: 24.0,
              onPressed: () {
                context.read(cartNotifier.notifier).remove(product);
              },
            ),
          ),
        );
      },
    );
  }
}
