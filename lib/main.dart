import 'package:flutter/material.dart';

import 'trekking/SliverListAndGuster.dart';
import 'trekking/staggered_trekking_animation.dart';

late TextDirection textDirection = TextDirection.ltr;
late bool page = false;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Directionality(
        textDirection: textDirection,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      textDirection == TextDirection.rtl
                          ? (textDirection = TextDirection.ltr)
                          : (textDirection = TextDirection.rtl);
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo)),
                  child: Text(
                    'click to change direction',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: ParentWidget(),
          // page == true ? SliverAndGusture() : StaggeredTrekkingAnimation(),
          drawer: Drawer(
            child: Column(children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: ClipOval(
                    child: Image.asset('assets/male.png'),
                  ),
                  accountName: Text('user'),
                  accountEmail: Text('email@email.com')),
              SizedBox(
                height: 100,
              ),
              SysBottomSheet(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      page = !page;
                    });
                  },
                  child: Text('sliverlist'))
            ]),
          ),
        ),
      ),
      // routes: {
      //   'SliverAndGusture': (context) => SliverAndGusture(),
      // },
    );
  }
}

class SysBottomSheet extends StatelessWidget {
  const SysBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        // child: const Text('showModalBottomSheet'),
        child: Text(' buttom sheet botton'),

        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    SliverAndGusture(),
    StaggeredTrekkingAnimation(),
    SliverAndGusture(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Widget'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen 3',
          ),
        ],
      ),
    );
  }
}
