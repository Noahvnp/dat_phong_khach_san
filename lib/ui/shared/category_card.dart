import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(15.0)),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
