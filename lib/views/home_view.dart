import 'package:flutter/material.dart';
import 'package:news_app/component.dart';
import 'package:news_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:  BoxDecoration(
            image: backgroundImageApp(),
          ),
          child: const HomePageBody(),
        ),
      ),
    );
  }
}
