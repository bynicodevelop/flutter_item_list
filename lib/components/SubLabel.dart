import 'package:flutter/material.dart';

class SubLabel extends StatelessWidget {
  final String label;
  final int maxLines;

  const SubLabel({
    Key key,
    this.label,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
