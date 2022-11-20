import 'package:flutter/material.dart';

import '../../models/cook.dart';

class CookDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const CookDetailScreen(
    this.cook, {
      super.key,
    });

    final Cook cook;

    @override
    Widget build (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(cook.title),
        ),
        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  cook.img,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  cook.description,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  textScaleFactor: 2,
                ),
              )
            ],
            )
          ),
      );
    }
}