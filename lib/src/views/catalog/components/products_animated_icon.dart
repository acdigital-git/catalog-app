import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:catalog_app/core/models/product.dart';
import 'package:catalog_app/core/providers/cart_providers.dart';
import 'package:catalog_app/src/constants/app_globals.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsAnimatedIcon extends HookWidget {
  const ProductsAnimatedIcon({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final _isSaved = useProvider(isSavedProduct(product));
    final _controller = useAnimationController(
      duration: AppGlobals.iconAnimDuration,
      initialValue: _isSaved ? 1 : 0,
    );

    return ProviderListener<bool>(
      provider: isSavedProduct(product),
      onChange: (context, productIsSaved) {
        if (productIsSaved) {
          if (_controller.status == AnimationStatus.dismissed)
            _controller.forward();
        } else {
          if (_controller.status == AnimationStatus.completed)
            _controller.reverse();
        }
      },
      child: Container(
        //color: Colors.white,
        child: AnimatedIconButton(
          animationController: _controller,
          onPressed: () => _isSaved
              ? context.read(cartNotifier.notifier).remove(product)
              : context.read(cartNotifier.notifier).add(product),
          size: 24.0,
          splashRadius: 24.0,
          icons: [
            AnimatedIconItem(
              icon: Icon(
                Icons.add_circle_rounded,
                color: AppStyles.lightGrey,
              ),
              tooltip: 'Add ${product.label} to shopping cart',
            ),
            AnimatedIconItem(
              icon: Icon(
                Icons.close,
                color: AppStyles.lightGrey,
              ),
              tooltip: 'Remove ${product.label} from shopping cart',
            ),
          ],
        ),
      ),
    );
  }
}
