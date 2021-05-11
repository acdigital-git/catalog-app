import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/core/providers/catalog_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsListView extends HookWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _products = useProvider(fakeCatalogApi);
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _products.length,
      itemBuilder: (context, index) => Material(
        borderRadius: BorderRadius.circular(6.0),
        clipBehavior: Clip.antiAlias,
        color: Colors.grey.shade800,
        child: ListTile(
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
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart_rounded),
            onPressed: () =>
                context.read(cartNotifier.notifier).add(_products[index]),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
    );
  }
}