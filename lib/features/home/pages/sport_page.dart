import 'package:flutter/material.dart';

class SportPage extends StatelessWidget {
  final String name;

  const SportPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
    );
  }
}
