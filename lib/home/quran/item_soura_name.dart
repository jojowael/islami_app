import 'package:flutter/material.dart';
import 'package:project1/home/quran/soura_details_screen.dart';
import 'package:project1/my_theme.dart';
import 'package:project1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSouraName extends StatelessWidget {
  String name;
  int index;

  ItemSouraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SouraDetailsScreen.routeName,
            arguments: SouraDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: provider.isDarkMode()
            ? Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.whiteColor)
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
