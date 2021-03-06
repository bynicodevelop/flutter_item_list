import 'package:flutter/material.dart';
import 'package:flutter_item_list/components/Label.dart';
import 'package:flutter_item_list/components/SubLabel.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';
import 'package:time_formatter/time_formatter.dart';

class Item extends StatelessWidget {
  final Function(dynamic data) onTap;

  final String uid;
  final String label;
  final String subLabel;
  final String avatarURL;
  final int sendAt;

  const Item({
    Key key,
    this.onTap,
    this.uid,
    this.label,
    this.subLabel,
    this.avatarURL,
    this.sendAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(uid),
      title: Container(
        margin: EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Row(
          children: [
            ProfileAvatar(
              username: label,
              avatarURL: avatarURL,
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    label: label,
                    sendAt: sendAt,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  SubLabel(
                    label: subLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
