import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_item_list/widgets/Item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Faker _faker = Faker();
  List<dynamic> _profiles = List<dynamic>();

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
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView.builder(
          itemCount: _profiles.length,
          itemBuilder: (context, index) => Item(
            onTap: (data) => print(data),
            uid: _profiles[index]['uid'],
            label: _profiles[index]['username'],
            subLabel: _profiles[index]['status'],
            avatarURL: _profiles[index]['avatarURL'],
          ),
        ),
      ),
    );
  }
}
