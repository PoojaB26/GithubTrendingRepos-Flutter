import 'package:flutter/material.dart';
import 'package:trending_github/github_home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Trending Repos',
      debugShowCheckedModeBanner: false,
      home: GithubHome(),
    );
  }
}
