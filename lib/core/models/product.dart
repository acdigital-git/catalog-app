import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product {
  final String id = Uuid().v4();
  final int price;
  final String label;
  final Color color;

  Product({
    required this.price,
    required this.label,
    required this.color,
  });
}
