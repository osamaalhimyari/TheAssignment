import 'package:flutter/material.dart';

// !  // /////  the call of the list
class MyApp extends StatelessWidget {
  final List<Map> myList = [
    {'name': 'Item 1'},
    {'name': 'Item 2'},
    {'name': 'Item 3'}
  ];
  final bool isListViewDismissed = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Dynamic ListView Example'),
          ),
          body: MyListViewIsSwaped(
              data: myList,
              LeftBackGround: new SwapeBackGround(
                  backGroundColor: Colors.green,
                  icon: Icons.archive,
                  text: 'archive',
                  mainAxisAlignment: MainAxisAlignment.end),
              RightBackGround: new SwapeBackGround(
                  backGroundColor: Color.fromARGB(255, 244, 54, 54),
                  icon: Icons.delete,
                  text: 'delete',
                  mainAxisAlignment: MainAxisAlignment
                      .start)) // When dismissed, return an empty Container widget

          ),
    );
  }
}

// !11111111111111111111111111111111111111

class MyListViewIsSwapedIsNonSwaped extends StatelessWidget {
  final List<String> data;
  const MyListViewIsSwapedIsNonSwaped({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(data[index]),
        );
      },
    );
  }
}
// !11111111111111111111111111111111111111

class MyListViewIsSwaped extends StatefulWidget {
  final List<Map> data;
  final SwapeBackGround LeftBackGround;
  final SwapeBackGround RightBackGround;
  // final Function() OnPressed;
  // final Widget listTile;
  const MyListViewIsSwaped(
      {required this.data,
      // required this.listTile,
      required this.LeftBackGround,
      required this.RightBackGround,
      // required this.OnPressed,
      super.key});
  @override
  _MyListViewIsSwapedState createState() => _MyListViewIsSwapedState();
}
// ! /////////////////////////////

class SwapeBackGround {
  SwapeBackGround(
      {required this.backGroundColor,
      required this.icon,
      required this.text,
      required this.mainAxisAlignment});
  final Color backGroundColor;
  final IconData icon;
  final String text;
  final MainAxisAlignment mainAxisAlignment;
}

class ListItem {
  final String name;
  final String? title;
  final String? number;
  ListItem(this.name, this.title, this.number);
}

class _MyListViewIsSwapedState extends State<MyListViewIsSwaped> {
  Map? removedItem;
  void _showSnackbar(BuildContext context, Map item, int index) {
    removedItem = item;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item ${item['id']} has been dismissed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              widget.data.insert(index, removedItem!);
            });
          },
        ),
      ),
    );
  }

  Container swapeBackgroundDesign(index, final Color backColor,
      final String text, final IconData icon, MainAxisAlignment alignment) {
    return Container(
      color: backColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final item = widget.data[index];

        return Dismissible(
            key: Key(item['name']),
            background: swapeBackgroundDesign(
                index,
                widget.RightBackGround.backGroundColor,
                widget.RightBackGround.text,
                widget.RightBackGround.icon,
                widget.RightBackGround.mainAxisAlignment),
            secondaryBackground: swapeBackgroundDesign(
                index,
                widget.LeftBackGround.backGroundColor,
                widget.LeftBackGround.text,
                widget.LeftBackGround.icon,
                widget.LeftBackGround.mainAxisAlignment),
            onDismissed: (direction) {
              setState(() {
                if (direction == DismissDirection.startToEnd) {
                  // Delete item
                  removedItem = widget.data.removeAt(index);
                } else if (direction == DismissDirection.endToStart) {
                  // Archive item
                  removedItem = widget.data.removeAt(index);
                }
              });

              _showSnackbar(context, removedItem!, index);
            },
            //
            child: ListTile(
              leading: Icon(Icons.abc),
              title: Text('data $index'),
              trailing: Icon(Icons.pin),
            ));
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
