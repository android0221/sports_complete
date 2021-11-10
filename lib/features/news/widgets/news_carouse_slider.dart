import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../entities/entities.dart';

class NewsCarouselSlider extends StatelessWidget {
  final List<News> newsList;

  const NewsCarouselSlider(this.newsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (newsList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          height: MediaQuery.of(context).size.height * 0.25,
          viewportFraction: 1,
        ),
        items: newsList.map((e) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(imageUrl: e.imageUrl, fit: BoxFit.cover),
                _Title(e.title),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.7),
              Colors.grey.withOpacity(0.7),
            ],
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
