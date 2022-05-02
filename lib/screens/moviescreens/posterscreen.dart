import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PosterScreen extends StatelessWidget {
  final String url;
  const PosterScreen(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(url),
    );
  }
}
