import 'package:flutter/material.dart';

class GridSticky extends StatelessWidget {
  final String text;

  const GridSticky(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFCCCCCC),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(child: Text(text)),
    );
  }
}
