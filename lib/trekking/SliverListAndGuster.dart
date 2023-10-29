import 'package:flutter/material.dart';
import 'package:stag_animation/trekking/ListViewAndSliverList/ListView.dart';
import 'package:stag_animation/trekking/ListViewAndSliverList/body.dart';
import 'package:stag_animation/trekking/ListViewAndSliverList/header.dart';

class SliverAndGusture extends StatefulWidget {
  const SliverAndGusture({super.key});

  @override
  State<SliverAndGusture> createState() => _SliverAndGustureState();
}

class _SliverAndGustureState extends State<SliverAndGusture> {
  final List<Map> people = [
    {'id': 1, 'name': 'one', 'title': '1'},
    {'id': 2, 'name': 'two', 'title': '2'},
    {'id': 3, 'name': 'three', 'title': '3'},
    {'id': 4, 'name': 'three', 'title': '3'},
    {'id': 5, 'name': 'three', 'title': '3'},
    {'id': 6, 'name': 'three', 'title': '3'},
    {'id': 8, 'name': 'three', 'title': '3'},
    {'id': 9, 'name': 'three', 'title': '3'},
    {'id': 10, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
    {'id': 11, 'name': 'three', 'title': '3'},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollWidgetBody(
      header: Header(
          child: ElevatedButton(onPressed: () {}, child: Text('data')),
          margin: 10),
      bodyListView: MyListViewIsSwaped(
          data: people,
          LeftBackGround: new SwapeBackGround(
              backGroundColor: Colors.green,
              icon: Icons.archive,
              text: 'archive',
              mainAxisAlignment: MainAxisAlignment.end),
          RightBackGround: new SwapeBackGround(
              backGroundColor: Color.fromARGB(255, 244, 54, 54),
              icon: Icons.delete,
              text: 'delete',
              mainAxisAlignment: MainAxisAlignment.start)),
    ));
  }
}
