import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('بطاقات أفقية ديناميكية'),
        ),
        body: CardList(), // استخدم واجهة CardList
      );
  }
}

class CardList extends StatelessWidget {
  final List<String> cardData = ['بطاقة 1', 'بطاقة 2', 'بطاقة 3', 'بطاقة 4', 'بطاقة 5'];

   CardList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal, // تعيين اتجاه العرض إلى الأفقي
      children: cardData.map((title) => CardWidget(title)).toList(),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;

  const CardWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        width: 150,
        height: 100,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}