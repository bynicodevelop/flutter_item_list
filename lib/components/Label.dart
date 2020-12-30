import 'package:flutter/material.dart';
import 'package:time_formatter/time_formatter.dart';

class Label extends StatelessWidget {
  final String label;
  final int sendAt;

  const Label({
    Key key,
    this.label,
    this.sendAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Visibility(
          visible: sendAt != null,
          child: Text(
            formatTime(sendAt ?? DateTime.now().millisecondsSinceEpoch),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
