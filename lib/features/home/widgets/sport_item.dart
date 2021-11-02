import 'package:flutter/material.dart';

class SportItem extends StatelessWidget {
  final String text;
  final String iconPath;

  const SportItem({
    Key? key,
    required this.text,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
