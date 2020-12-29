import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';

class Item extends StatelessWidget {
  final Function(dynamic data) onTap;

  final String uid;
  final String label;
  final String subLabel;
  final String avatarURL;

  const Item({
    Key key,
    this.onTap,
    this.uid,
    this.label,
    this.subLabel,
    this.avatarURL,
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
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  subLabel,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
