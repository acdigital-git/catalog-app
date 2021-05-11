import 'package:flutter/material.dart';

class CartViewModel extends StatelessWidget {
  const CartViewModel({Key? key, required String title})
      : _title = title,
        super(key: key);
  final String _title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.store_rounded),
          title: Text(_title),
        ),
        body: Center(
          child: Text('Cart'),
        ),
      ),
    );
  }
}
