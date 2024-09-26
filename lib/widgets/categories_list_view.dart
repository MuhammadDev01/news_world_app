import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/assets_images.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      image: Assets.imagesBusiness,
      name: 'Business',
    ),
    CategoryModel(
      image: Assets.imagesHealth,
      name: 'Health',
    ),
    CategoryModel(
      image: Assets.imagesScience,
      name: 'Science',
    ),
    CategoryModel(
      image: Assets.imagesSport,
      name: 'Sports',
    ),
    CategoryModel(
      image: Assets.imagesTech,
      name: 'Technology',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          
          children: categories.map((e) => CategoryCard(category: e)).toList(),
        ),
      ),
    );
  }
}
