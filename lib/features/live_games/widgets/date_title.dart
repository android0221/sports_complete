import 'package:flutter/material.dart';

class DateTitle extends StatelessWidget {
  final String date;

  const DateTitle(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFCCCCCC),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(date),
    );
  }
}
