import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../entities/entities.dart';
import '../pages/news_detail_page.dart';

class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NewsDetailPage(news)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.dateTime,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: Theme.of(context).disabledColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: news.imageUrl,
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
