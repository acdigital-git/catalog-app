import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '0 items in your cart...',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.store_rounded),
          label: Text(
            'Go Shopping',
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
