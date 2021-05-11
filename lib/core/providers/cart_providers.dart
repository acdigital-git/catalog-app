import 'package:catalog_app/core/models/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartNotifier = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier([List<Product>? items]) : super(items ?? []);

  void add(Product newProduct) => state = [
        ...state,
        newProduct,
      ];

  void remove(String productId) {
    state.removeWhere((product) => product.id == productId);
    state = [
      ...state,
    ];
  }
}
