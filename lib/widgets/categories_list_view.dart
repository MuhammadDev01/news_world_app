import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
 final List<CategoryModel> categories = const[
    CategoryModel(
      image: 'assets/business.png',
      name: 'Business',
    ),
    CategoryModel(
      image: 'assets/entertaiment.jpg',
      name: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/health.avif',
      name: 'Health',
    ),
    CategoryModel(
      image: 'assets/science.avif',
      name: 'Science',
    ),
    CategoryModel(
      image: 'assets/sports.png',
      name: 'Sports',
    ),
    CategoryModel(
      image: 'assets/technology.jpeg',
      name: 'Technology',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder:(context,index)=> CategoryCard(
            category: categories[index],
          ),
        ),
    );
  }
}
