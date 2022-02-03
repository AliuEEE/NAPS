import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naps_app/services/apicall_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiCalls client = ApiCalls();

  @override
  void initState() {
    // TODO: implement initState

    client.getData("business");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAPS'),
      ),
    );
  }
}
