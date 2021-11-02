import 'package:flutter/material.dart';

class ErrorRetry extends StatelessWidget {
  final VoidCallback? onRetry;

  const ErrorRetry({Key? key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('加载失败'),
          if (onRetry != null)
            OutlinedButton(
              onPressed: onRetry,
              child: const Text('重新加载'),
            ),
        ],
      ),
    );
  }
}
