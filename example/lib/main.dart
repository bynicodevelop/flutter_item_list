import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_item_list_example/navigations/ItemScreen.dart';
import 'package:flutter_item_list_example/navigations/MessageScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Faker _faker = Faker();

  final List<dynamic> _profiles = List<dynamic>();
  final List<Widget> _widgets = List<Widget>();

  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();

    // Creating a List of UserModel
    for (int i = 0; i < 30; i++) {
      int randInt = _faker.randomGenerator.integer(9);

      _profiles.add(
        {
          'uid': _faker.randomGenerator.string(10),
          'username': _faker.person.name(),
          'status': randInt % 3 != 0 ? _faker.lorem.sentences(2).join(' ') : '',
          'avatarURL': randInt % 3 != 0
              ? _faker.image.image(width: 200, height: 200, keywords: [
                  'person',
                  DateTime.now().toString(),
                ])
              : null,
          'sendAt': DateTime.now()
              .subtract(Duration(minutes: 30 - (i + 1)))
              .millisecondsSinceEpoch
        },
      );
    }

    _widgets.addAll([
      ItemScreen(
        profiles: _profiles,
      ),
      MessageScreen(
        profiles: _profiles,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _widgets.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) => setState(() => _currentIndex = value),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Default',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Messages',
            ),
          ],
        ),
      ),
    );
  }
}
