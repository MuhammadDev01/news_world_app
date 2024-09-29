import 'package:flutter/material.dart';

class CategoryModel {
  final String image;
  final String name;
  final Widget page;

  const CategoryModel({
    required this.image,
    required this.name,
    required this.page,
  });
}
