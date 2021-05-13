import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/constants/app_globals.dart';
import 'package:catalog_app/src/hooks/animated_int_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartTotal extends HookWidget {
  const CartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int _total = useProvider(cartTotal);
    // CUSTOM HOOK :: animates into a tween and consumes it with useAnimation()
    final int _totalAnimated =
        useAnimatedInt(counter: _total, duration: AppGlobals.iconAnimDuration);
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Center(
        child: Text(
          'total :  $_totalAnimated \$',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
