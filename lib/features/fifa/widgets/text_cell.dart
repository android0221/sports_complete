import 'package:flutter/material.dart';

class TextCell extends StatelessWidget {
  final String text;

  const TextCell(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
