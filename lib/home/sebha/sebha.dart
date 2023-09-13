import 'package:flutter/material.dart';

class Sebhatab extends StatefulWidget {
  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  double turns = 0;
  int counter = 0;

  void incrementCounter() {
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedRotation(
          turns: turns,
          duration: Duration(seconds: 1),
          child: Image.asset(
            'assets/images/sebha_image.png',
            height: 300,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffC8B396),
                  borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                  onPressed: () {
                    setState(() => turns += 1 / 4);
                  },
                  child: Text(
                    'Rotate Sebha',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffB7935F),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'سبحان الله',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
