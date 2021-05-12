import 'dart:math';

import 'package:catalog_app/core/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fakeCatalogApi = FutureProvider.autoDispose<List<Product>>(
  (ref) async {
    final products = <Product>[];
    for (var i = 0; i < 30; i++) {
      final price = Random().nextInt(80) + 20;
      final color =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      products.add(
        Product(
          price: price,
          label: 'Product ${i + 1}',
          color: color,
        ),
      );
    }
    await Future.delayed(const Duration(milliseconds: 1500));
    return products;
  },
);
