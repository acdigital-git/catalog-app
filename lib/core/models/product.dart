import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product {
  final String id = Uuid().v4();
  final int price;
  final String label = generateWordPairs().take(1).first.asString;
  final Color color;

  Product({
    required this.price,
    required this.color,
  });
}
