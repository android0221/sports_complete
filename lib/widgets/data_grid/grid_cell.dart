import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridTextCell extends StatelessWidget {
  final String text;

  const GridTextCell(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: _Text(text)));
  }
}

class GridLogoCell extends StatelessWidget {
  final String text;
  final String logoUrl;
  final bool logoFirst;

  const GridLogoCell({
    Key? key,
    required this.text,
    required this.logoUrl,
    required this.logoFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          logoFirst
              ? _image()
              : Expanded(child: _Text(text, textAlign: TextAlign.end)),
          const SizedBox(width: 6),
          logoFirst ? Expanded(child: _Text(text)) : _image(),
        ],
      ),
    );
  }

  Widget _image() => logoUrl.isEmpty
      ? const SizedBox.shrink()
      : CachedNetworkImage(imageUrl: logoUrl, width: 32, height: 32);
}

class _Text extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const _Text(this.text, {Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontSize: 13,
          ),
    );
  }
}
