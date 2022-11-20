import 'package:flutter/material.dart';

import 'cook_grid.dart';
import 'edit_cook_screen.dart';

enum FilterOptions { favorites, all }

class CookOverviewScreen extends StatefulWidget {
  const CookOverviewScreen({super.key});

  @override
  State <CookOverviewScreen> createState() => _CookOverviewScreenState();

}

class _CookOverviewScreenState extends State<CookOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dạy nấu ăn"),
        actions: <Widget>[
          buildAddButton(context),
          buildCookFilterMenu(),
        ],
      ),
      body: CGrid(_showOnlyFavorites),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditCookScreen.routeName,
        );
      },
    );
  }

  Widget buildCookFilterMenu(){
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if(selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          }else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Món ăn yêu thích'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Tất cả'),
        ),
      ],
    );
  }

}