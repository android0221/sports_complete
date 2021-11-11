import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../entities/entities.dart';

class NewsCarouselSlider extends StatefulWidget {
  final List<News> newsList;

  const NewsCarouselSlider(this.newsList, {Key? key}) : super(key: key);

  @override
  State<NewsCarouselSlider> createState() => _NewsCarouselSliderState();
}

class _NewsCarouselSliderState extends State<NewsCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.newsList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        _Slider(
          widget.newsList,
          onPageChanged: (index) => setState(() => _currentIndex = index),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: _Indicators(
            count: widget.newsList.length,
            selectedIndex: _currentIndex,
          ),
        ),
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  final List<News> newsList;
  final ValueChanged<int> onPageChanged;

  const _Slider(this.newsList, {Key? key, required this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        viewportFraction: 1,
        onPageChanged: (index, _) => onPageChanged(index),
        enableInfiniteScroll: false,
      ),
      items: newsList.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(imageUrl: e.imageUrl, fit: BoxFit.cover),
                _Title(e.title),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black,
            ],
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

class _Indicators extends StatelessWidget {
  final int count;
  final int selectedIndex;

  const _Indicators({
    Key? key,
    required this.count,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          width: 5,
          height: 5,
          margin: EdgeInsets.only(right: index < count - 1 ? 5 : 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == selectedIndex
                ? Colors.white
                : Colors.white.withOpacity(0.5),
          ),
        );
      }),
    );
  }
}
