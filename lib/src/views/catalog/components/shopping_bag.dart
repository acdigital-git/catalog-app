import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/constants/app_icons.dart';
import 'package:catalog_app/src/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShoppingBag extends HookWidget {
  const ShoppingBag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartCount = useProvider(cartItemCount);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        IconButton(
          icon: Icon(
            AppIcons.cart,
            size: AppIcons.mediumSize,
          ),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
        ),
        _cartCount > 0
            ? Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 18.0,
                    minHeight: 18.0,
                  ),
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$_cartCount',
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
