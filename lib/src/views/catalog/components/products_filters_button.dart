import 'package:catalog_app/src/constants/app_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:catalog_app/core/providers/catalog_providers.dart';
import 'package:flutter/material.dart';

class ProductsFiltersBtn extends StatelessWidget {
  const ProductsFiltersBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CatalogFilters>(
      onSelected: (newFilter) =>
          context.read(catalogFilterNotifier.notifier).update(newFilter),
      initialValue: CatalogFilters.initial,
      icon: Icon(Icons.sort_rounded),
      iconSize: AppIcons.mediumSize,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: CatalogFilters.initial,
          child: Text('default'),
        ),
        PopupMenuItem(
          value: CatalogFilters.alphabetical,
          child: Text('alphabetical asc'),
        ),
        PopupMenuItem(
          value: CatalogFilters.alphabeticalDesc,
          child: Text('alphabetical desc'),
        ),
        PopupMenuItem(
          value: CatalogFilters.ascPrice,
          child: Text('lower price'),
        ),
        PopupMenuItem(
          value: CatalogFilters.descPrice,
          child: Text('higher price'),
        ),
      ],
    );
  }
}
