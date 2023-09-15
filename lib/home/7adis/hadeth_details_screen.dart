import 'package:flutter/material.dart';
import 'package:project1/home/7adis/hadeth.dart';
import 'package:project1/home/7adis/item_hadeth_details.dart';
import 'package:project1/my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.06,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: MyTheme.whiteColor),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ),
        ),
      ],
    );
  }
}
