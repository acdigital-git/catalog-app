import 'package:catalog_app/src/constants/app_routes.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '0 items in your cart...',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.catalog),
            icon: Icon(Icons.store_rounded),
            label: Text(
              'Go Shopping',
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
