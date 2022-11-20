import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../orders/orders_manager.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            width: 360,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            '4.3',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.local_atm_outlined,
                            color: Colors.lightBlue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.lightBlue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: product.location,
                                  style: TextStyle(
                                    color: Colors.black87.withOpacity(.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Colors.lightBlue,
                          ),
                        ),
                        // child: const Icon(
                        //   Icons.favorite_border,
                        //   color: Colors.lightBlue,
                        // ),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: product.isFavoriteListenable,
                          builder: (ctx, isFavorite, child) {
                            return IconButton(
                              icon: Icon(
                                product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                              onPressed: () {
                                ctx
                                    .read<ProductsManager>()
                                    .toggleFavoriteStatus(product);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            border: Border.all(color: Colors.lightBlue),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                              child: TextButton(
                            onPressed: () {
                              cart.addItem(product);
                              context.read<OrdersManager>().addOrder(
                                    cart.products,
                                    cart.totalAmount,
                                  );
                              cart.clear();
                            },
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            child: const Text(
                              'Đặt ngay',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
