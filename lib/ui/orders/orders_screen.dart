import 'package:flutter/material.dart';
import 'package:myshop/ui/shared/app_bottomnavbar.dart';
import 'package:provider/provider.dart';

import 'orders_manager.dart';
import 'order_item_card.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Phòng đã đặt'),
      ),
      body: Consumer<OrdersManager>(
        builder: (ctx, ordersManager, child) {
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx, i) => OrderItemCard(
              ordersManager.orders[i],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
