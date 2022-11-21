import 'package:flutter/material.dart';
import 'package:myshop/ui/products/edit_product_screen.dart';
import 'package:provider/provider.dart';

import 'user_product_list_tile.dart';
import 'products_manager.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    final productsMananger = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách khách sạn'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      body: FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: buildUserProductListView(productsMananger),
          );
        },
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productsMananger) {
    return Consumer<ProductsManager>(
      builder: (ctx, productsMananger, child) {
        return ListView.builder(
          itemCount: productsMananger.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductListTile(
                productsMananger.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
          arguments: null,
        );
      },
    );
  }
}
