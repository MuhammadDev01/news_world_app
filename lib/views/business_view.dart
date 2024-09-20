import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) => const Scaffold(),
    );
  }
}
