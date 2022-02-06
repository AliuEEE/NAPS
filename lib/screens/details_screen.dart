import 'package:flutter/material.dart';
import 'package:naps_app/models/business_endpoint/article_model.dart';

class DetailScreen extends StatefulWidget {
  final Article? article;
  DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "${widget.article?.title}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
