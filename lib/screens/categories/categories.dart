import 'package:flutter/material.dart';
import 'package:ndia_app/screens/categories/categories.body.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: CategoriesBody(),
      ),
    );
  }
}
