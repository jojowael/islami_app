import 'package:flutter/material.dart';
import 'package:project1/my_theme.dart';
import 'package:project1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(
          child: Container(
            child: Image.asset(
              'assets/images/radio_image.png',
              height: 350,
            ),
          ),
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.whiteColor)
              : Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous, size: 40),
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow, size: 40),
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next, size: 40),
              color: Theme.of(context).primaryColor,
            )
          ],
        )
      ],
    );
  }
}
