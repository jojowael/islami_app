import 'package:flutter/material.dart';
import 'package:project1/home/quran/soura_details_screen.dart';

class ItemSouraName extends StatelessWidget {
  String name;
  int index;

  ItemSouraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SouraDetailsScreen.routeName,
            arguments: SouraDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
