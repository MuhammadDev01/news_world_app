import 'package:flutter/material.dart';
import 'package:news_app/utils/assets_images.dart';
import 'package:news_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.imagesT,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            const HomePageBody(),
          ],
        ),
      ),
    );
  }
}
