import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_grid.dart';

import '../shared/app_bottomnavbar.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({Key? key}) : super(key: key);
  static const routeName = '/user-favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.lightBlue,
              size: 30,
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Phòng yêu thích',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: const ProductsGrid(true),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
