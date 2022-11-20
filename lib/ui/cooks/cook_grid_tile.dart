import 'package:flutter/material.dart';

import '../../models/cook.dart';
import 'cook_detail_screen.dart';

class CookGrid extends StatelessWidget {
  const CookGrid(
    this.cook, {
      super.key,
    });

    final Cook cook;

    @override
    Widget build(BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: buildGridFooterBar(context),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CookDetailScreen(cook)
                ),
              );
            },
            child: Image.network(
              cook.img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget buildGridFooterBar(BuildContext context) {
      return GridTileBar(
        backgroundColor: Colors.black87,
        leading: ValueListenableBuilder<bool>(
          valueListenable: cook.isFavoriteListenable,
          builder: (ctx, isFavorite, child) {
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                cook.isFavorite = !isFavorite;
              },
            );
          },
        ),
        title: Text(
          cook.title,
          textAlign: TextAlign.center,
          textScaleFactor: 2,
        ),
      );
    }
}