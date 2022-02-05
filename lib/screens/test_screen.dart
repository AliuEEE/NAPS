import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:naps_app/models/business_endpoint/article_model.dart';
import 'package:naps_app/services/apicall_service.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);

  final ApiCalls client = ApiCalls();
  //final AnotherApiCalls client = AnotherApiCalls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Test"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: client.getData("sports"),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article?>> snapshot) {
          if (snapshot.hasData) {
            List<Article?>? articles = snapshot.data;
            if (kDebugMode) {
              for (var i = 0; i < 10; i++) {
                print("${articles![i]?.title}\n");
              }
            }
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(articles[index]!.title.toString()),
                subtitle: Text(articles[index]!.description.toString()),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
