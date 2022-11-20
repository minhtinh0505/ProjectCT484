import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cook_grid_tile.dart';
import 'cook_manager.dart';
import '../../models/cook.dart';

class CGrid extends StatelessWidget {
  final bool showFavorites;

  const CGrid (this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final cookManager = CookManager();
    final cooks = context.select<CookManager, List<Cook>>(
      (cookManager) => showFavorites
      ? cookManager.favoriteItems
      : cookManager.items
    );
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: cooks.length,
      itemBuilder: (ctx, i) => CookGrid(cooks[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        ),
    );
  }
}