import 'package:catalog_app/core/models/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartNotifier = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);

final isSavedProduct = Provider.family<bool, Product>((ref, product) {
  final cart = ref.watch(cartNotifier);
  return cart.contains(product);
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier([List<Product>? items]) : super(items ?? []);

  void add(Product newProduct) => state = [
        ...state,
        newProduct,
      ];

  void remove(Product product) {
    state.remove(product);
    state = [
      ...state,
    ];
  }
}
