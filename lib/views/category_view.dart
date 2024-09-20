import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const Padding(
          padding: EdgeInsets.all(12.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [],
          ),
        ),
      ),
    );
  }
}
