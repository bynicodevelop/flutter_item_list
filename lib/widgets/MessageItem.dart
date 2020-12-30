import 'package:flutter/material.dart';
import 'package:flutter_item_list/components/Label.dart';
import 'package:flutter_item_list/components/SubLabel.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';

class MessageItem extends StatelessWidget {
  final Function(dynamic data) onTap;

  final String uid;
  final String label;
  final String subLabel;
  final String avatarURL;
  final int sendAt;

  const MessageItem({
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: ProfileAvatar(
                username: label,
                avatarURL: avatarURL,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    label: label,
                    sendAt: sendAt,
                  ),
                  SubLabel(
                    label: subLabel,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Divider(
                      color: Colors.grey[800],
                    ),
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
