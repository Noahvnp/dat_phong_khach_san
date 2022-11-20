import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myshop/ui/screens.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return GNav(tabs: [
      GButton(
        icon: Icons.home,
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
      ),
      GButton(
        icon: Icons.favorite_border,
        onPressed: () {
          Navigator.of(context).pushNamed(UserFavoriteScreen.routeName);
        },
      ),
      GButton(
        icon: Icons.card_travel,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
        },
      ),
      GButton(
        icon: Icons.person_outline,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(UserProfileScreen.routeName);
        },
      )
    ]);
  }
}