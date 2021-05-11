import 'dart:math';

import 'package:catalog_app/core/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fakeCatalogApi = Provider<List<Product>>(
  (ref) {
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
    return products;
  },
);
