import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/app_style.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.modelCategory,
  });
  final CategoryModel modelCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return modelCategory.page;
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                modelCategory.image,
                colorFilter: ColorFilter.mode(
                  Colors.grey.shade900.withOpacity(0.3),
                  BlendMode.srcOver,
                ),
                height: 120,
              ),
            ),
            Text(
              modelCategory.name,
              style: AppStyle.style16medium,
            ),
          ],
        ),
      ),
    );
  }
}
