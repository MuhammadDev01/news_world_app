import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryView(
                category: category.name,
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                category.image,
                colorFilter: ColorFilter.mode(
                    Colors.grey.shade900.withOpacity(0.3), BlendMode.srcOver),
                height: 120,
              ),
            ),
            Text(
              category.name,
              style: AppStyle.style16medium,
            ),
          ],
        ),
      ),
    );
  }
}
