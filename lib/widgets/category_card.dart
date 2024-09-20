import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryView(category: category.name,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    category.image,
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade900.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
