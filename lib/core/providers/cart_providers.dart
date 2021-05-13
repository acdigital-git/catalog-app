import 'package:catalog_app/core/models/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartTotal = Provider<int>((ref) {
  final cart = ref.watch(cartNotifier);
  var total = 0;
  for (var product in cart) {
    total += product.price;
  }
  return total;
});

final cartItemCount = Provider<int>((ref) {
  final itemCount = ref.watch(cartNotifier).length;
  return itemCount;
});

final isSavedProduct = Provider.family<bool, Product>((ref, product) {
  final cart = ref.watch(cartNotifier);
  return cart.contains(product);
});

// NOTIFIER

final cartNotifier = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);

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
