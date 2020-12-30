import 'package:flutter/material.dart';
import 'package:flutter_item_list/widgets/Item.dart';

class ItemScreen extends StatelessWidget {
  final List<dynamic> profiles;

  const ItemScreen({
    Key key,
    this.profiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      itemCount: profiles.length,
      itemBuilder: (context, index) => Item(
        onTap: (data) => print(data),
        uid: profiles[index]['uid'],
        label: profiles[index]['username'],
        subLabel: profiles[index]['status'],
        avatarURL: profiles[index]['avatarURL'],
      ),
    );
  }
}
