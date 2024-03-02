import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<dynamic> items;
  final Function itemBuilder;

  const CustomListView({
    Key? key,
    required this.items,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemBuilder(context, items[index]);
      },
    );
  }
}

