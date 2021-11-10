import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../entities/news.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: WebView(
        initialUrl: news.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
