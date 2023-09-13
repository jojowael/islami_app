import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/home/quran/item_soura_details.dart';
import 'package:project1/my_theme.dart';

class SouraDetailsScreen extends StatefulWidget {
  static const String routeName = 'soura_details';

  @override
  State<SouraDetailsScreen> createState() => _SouraDetailsScreenState();
}

class _SouraDetailsScreenState extends State<SouraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SouraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
              '${args.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.06,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: MyTheme.whiteColor),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemSouraDetails(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SouraDetailsArgs {
  String name;
  int index;

  SouraDetailsArgs({required this.name, required this.index});
}
