import 'package:catalog_app/core/models/product.dart';
import 'package:catalog_app/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

Material buildProductListTile(
    {required Product product, VoidCallback? callback, Widget? trailing}) {
  return Material(
    borderRadius: BorderRadius.circular(6.0),
    clipBehavior: Clip.antiAlias,
    color: AppStyles.mediumGrey,
    child: ListTile(
      key: ValueKey(product.id),
      contentPadding: AppStyles.tilePadding,
      onTap: callback ?? null,
      leading: CircleAvatar(
        backgroundColor: product.color,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(product.label),
      ),
      subtitle: Text(
        product.price.toString() + ' \$',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: trailing,
    ),
  );
}
