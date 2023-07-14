import 'package:ecogram/Tools/bubbleStories.dart';
import 'package:flutter/material.dart';
import 'package:ecogram/constants.dart';

class Timelines extends StatefulWidget {
  @override
  _TimelinesState createState() => _TimelinesState();
}

final List people = [
  'francesco.buscicchio',
  'mario.gervario',
  'roberta.ribezzo',
  'marisa.resta',
  'maggy.angeli',
  'maria.preteso'
];

class _TimelinesState extends State<Timelines> {
  @override
  Widget build(BuildContext context) {
    return const Text('Timeline');
  }
}

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Ecogram",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold)),
            Row(children: const [
              Icon(
                Icons.add,
                color: kPrimaryColor,
              ),
              Padding(padding: EdgeInsets.all(15)),
              Icon(
                Icons.favorite,
                color: kPrimaryColor,
              ),
              Padding(padding: EdgeInsets.all(15)),
              Icon(
                Icons.share,
                color: kPrimaryColor,
              )
            ])
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return BubbleStories(text: people[index]);
                }),
          )
        ],
      ),
    );
  }
}
