import 'dart:math';

import 'package:catalog_app/core/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CatalogFilters {
  initial,
  alphabetical,
  alphabeticalDesc,
  ascPrice,
  descPrice,
}

final catalogFilterNotifier =
    StateNotifierProvider<CatalogFilterNotifier, CatalogFilters>(
  (ref) => CatalogFilterNotifier(),
);

final fakeCatalogApi = Provider<List<Product>>((ref) {
  final products = <Product>[];
  for (var i = 0; i < 30; i++) {
    // Generate random PRICE
    const min = 20;
    const max = 100;
    final price = min + Random().nextInt(max - min);
    // Generate random COLOR
    final color =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    products.add(
      Product(
        price: price,
        color: color,
      ),
    );
  }
  return products;
});

final filteredCatalogApi = Provider.autoDispose<List<Product>>(
  (ref) {
    final products = ref.watch(fakeCatalogApi);
    final filter = ref.watch(catalogFilterNotifier);
    var filteredList = [...products];
    switch (filter) {
      case CatalogFilters.alphabetical:
        filteredList
            .sort((one, two) => one.label.toLowerCase().compareTo(two.label));
        return filteredList;
      case CatalogFilters.alphabeticalDesc:
        filteredList
            .sort((one, two) => two.label.toLowerCase().compareTo(one.label));
        return filteredList;
      case CatalogFilters.ascPrice:
        filteredList.sort((one, two) => one.price.compareTo(two.price));
        return filteredList;
      case CatalogFilters.descPrice:
        filteredList.sort((one, two) => two.price.compareTo(one.price));
        return filteredList;
      case CatalogFilters.initial:
      default:
        return products;
    }
  },
);

class CatalogFilterNotifier extends StateNotifier<CatalogFilters> {
  CatalogFilterNotifier([CatalogFilters? initialFilter])
      : super(initialFilter ?? CatalogFilters.initial);

  void setInitial() => state = CatalogFilters.initial;
  void setAlphabetical() => state = CatalogFilters.alphabetical;
  void setAscPrice() => state = CatalogFilters.ascPrice;
  void setDescPrice() => state = CatalogFilters.descPrice;
  void update(CatalogFilters filter) => state = filter;
}
