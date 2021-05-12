import 'package:catalog_app/core/models/product.dart';
import 'package:catalog_app/core/providers/cart_providers.dart';
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
      duration: const Duration(milliseconds: 400),
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
      child: IconButton(
        onPressed: () {
          if (_controller.isDismissed) {
            context.read(cartNotifier.notifier).add(product);
          } else if (_controller.isCompleted) {
            context.read(cartNotifier.notifier).remove(product);
          }
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.add_event,
          progress: _controller,
        ),
      ),
    );
  }
}
