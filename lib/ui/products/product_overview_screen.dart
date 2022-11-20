import 'package:flutter/material.dart';

import 'package:myshop/models/places_item.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../shared/app_bottomnavbar.dart';
import '../shared/category_card.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final hotelItem = context.watch<ProductsManager>().items;
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
              'Chào Bạn!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Cùng khám phá kì nghỉ nào!',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on),
                    label: const Text(
                      'Cần Thơ',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.lightBlue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 6, left: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Khám phá',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Tất cả',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    title: 'Căn hộ',
                    press: () {},
                  ),
                  CategoryCard(
                    title: 'Nhà cho thuê',
                    press: () {},
                  ),
                  CategoryCard(
                    title: 'Homestay',
                    press: () {},
                  ),
                  CategoryCard(
                    title: 'Biệt thự',
                    press: () {},
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Khám phá khách sạn tại các điểm đến',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: places.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(places[index].imageUrl),
                                fit: BoxFit.cover,
                                opacity: 0.7,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    places[index].name,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Gợi ý khách sạn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  // height: 100,
                  child: ListView.builder(
                    itemCount: hotelItem.length,
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(hotelItem[index].imageUrl),
                        ),
                        title: Text(hotelItem[index].title),
                        trailing: Text(hotelItem[index].price.toString()),
                        subtitle: Text(hotelItem[index].location),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            ProductDetailScreen.routeName,
                            arguments: hotelItem[index].id,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
