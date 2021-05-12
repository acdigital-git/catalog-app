import 'package:catalog_app/core/models/product.dart';
import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartAnimatedList extends HookWidget {
  CartAnimatedList({Key? key}) : super(key: key);

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final _products = useProvider(cartNotifier);

    return AnimatedList(
      key: _listKey,
      padding: const EdgeInsets.all(16),
      initialItemCount: _products.length,
      itemBuilder: (context, index, animation) {
        final _hasSeparator = index < (_products.length - 1);
        return Padding(
          padding: _hasSeparator
              ? const EdgeInsets.only(bottom: 16.0)
              : const EdgeInsets.all(0),
          child: CartListTile(
            product: _products[index],
            index: index,
            animation: animation,
          ),
        );
      },
    );
  }
}

class CartListTile extends StatelessWidget {
  const CartListTile({
    Key? key,
    required this.product,
    required this.index,
    required this.animation,
  }) : super(key: key);
  final Animation<double> animation;
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Material(
        borderRadius: BorderRadius.circular(6.0),
        clipBehavior: Clip.antiAlias,
        color: AppStyles.mediumGrey,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: product.color,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(product.label),
          ),
          subtitle: Text(
            product.price.toString() + ' \$',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(Icons.clear_rounded),
            onPressed: () {
              context.read(cartNotifier.notifier).remove(product);
            },
          ),
        ),
      ),
    );
  }
}
