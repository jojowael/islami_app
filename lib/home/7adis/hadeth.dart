import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/my_theme.dart';
import 'package:project1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadethField();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_image.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          'Hadeth Name',
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.whiteColor)
              : Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        ahadethList.isEmpty
            ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(ahadethList[index].title,
                        style: provider.isDarkMode()
                            ? Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: MyTheme.whiteColor)
                            : Theme.of(context).textTheme.titleSmall);
                  },
                  itemCount: ahadethList.length,
                ),
              )
      ],
    );
  }

  void loadHadethField() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
