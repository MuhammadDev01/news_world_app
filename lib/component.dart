import 'package:flutter/material.dart';
import 'package:news_app/utils/assets_images.dart';

DecorationImage backgroundImageApp() => const DecorationImage(
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black26,
        BlendMode.dstOver,
      ),
      image: AssetImage(
        Assets.imagesT,
      ),
    );
