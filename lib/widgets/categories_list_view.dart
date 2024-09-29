import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/assets_images.dart';
import 'package:news_app/views/business_view.dart';
import 'package:news_app/views/health_view.dart';
import 'package:news_app/views/science_view.dart';
import 'package:news_app/views/sports_view.dart';
import 'package:news_app/views/technology_view.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      image: Assets.imagesBusiness,
      name: 'Business',
      page: BusinessView(),
    ),
    CategoryModel(
      image: Assets.imagesHealth,
      name: 'Health',
      page: HealthView(),
    ),
    CategoryModel(
      image: Assets.imagesScience,
      name: 'Science',
      page: ScienceView(),
    ),
    CategoryModel(
      image: Assets.imagesSport,
      name: 'Sports',
      page: SportsView(),
    ),
    CategoryModel(
      image: Assets.imagesTech,
      name: 'Technology',
      page: TechnologyView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: categories.map((categoryModel) {
            return CategoryCard(modelCategory: categoryModel);
          }).toList(),
        ),
      ),
    );
  }
}
