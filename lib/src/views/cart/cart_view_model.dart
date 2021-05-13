import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/constants/app_icons.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:catalog_app/src/views/cart/components/cart_animated_list.dart';
import 'package:catalog_app/src/views/cart/components/cart_empty.dart';
import 'package:catalog_app/src/views/cart/components/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartViewModel extends HookWidget {
  const CartViewModel({Key? key, required String title})
      : _title = title,
        super(key: key);
  final String _title;
  @override
  Widget build(BuildContext context) {
    final _emptyCart = useProvider(cartNotifier.select((list) => list.isEmpty));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: [
            CartTotal(),
          ],
        ),
        body: Container(
          width: double.infinity,
          child: _emptyCart ? CartEmpty() : CartAnimatedList(),
        ),
        floatingActionButton: _emptyCart
            ? null
            : FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side: BorderSide(
                    color: AppStyles.lightGrey,
                    width: 2.0,
                  ),
                ),
                backgroundColor: Colors.grey.shade900,
                onPressed: () {},
                label: Text(
                  'Pay Now',
                  style: TextStyle(
                    color: AppStyles.lightGrey,
                  ),
                ),
                icon: Icon(
                  AppIcons.pay,
                  color: AppStyles.lightGrey,
                ),
              ),
      ),
    );
  }
}
