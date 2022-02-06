import 'package:flutter/material.dart';
import 'package:naps_app/models/business_endpoint/article_model.dart';
import 'package:naps_app/screens/details_screen.dart';

class NewsWidget extends StatelessWidget {
  final Article? article;

  NewsWidget({Key? key, required this.article}) : super(key: key);

  final defaultImage =
      "https://cleantechnica.com/files/2022/02/Ford-electric-vehicle-solid-state-battery.png";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      article: article,
                    )),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article?.urlToImage ?? defaultImage),
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${article?.title}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    article?.description ?? "${article?.url}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
