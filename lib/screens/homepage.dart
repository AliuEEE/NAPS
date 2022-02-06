import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naps_app/models/business_endpoint/article_model.dart';
import 'package:naps_app/services/apicall_service.dart';
import 'package:naps_app/widgets/news_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String pageTitle = "Business";

  ApiCalls client = ApiCalls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: client.getData(pageTitle),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article?>> snapshot) {
            if (snapshot.hasData) {
              List<Article?>? articles = snapshot.data;

              return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) => NewsWidget(
                        article: articles[index],
                      ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
