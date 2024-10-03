import 'package:flutter/material.dart';
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
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.2,
          width: MediaQuery.sizeOf(context).width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                modelCategory.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  modelCategory.name,
                  style: AppStyle.style18medium(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
