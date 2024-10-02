import 'package:flutter/material.dart';
import 'package:news_app/component.dart';
import 'package:news_app/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: backgroundImageApp(),
          ),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
