import 'package:flutter/material.dart';

class GithubHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        elevation: 0.0,
        title: Text('Trending Repositories'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }

}