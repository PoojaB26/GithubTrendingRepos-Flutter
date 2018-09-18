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
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index){
              return RepoCard();
            }),
      ),
    );
  }

}


class RepoCard extends StatelessWidget{

  _getAvatar(){
    return CircleAvatar(
      radius: 20.0,
      backgroundColor: Colors.grey,
    );
  }

  _getRepoInfo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20.0
            ),
            children: [
              TextSpan(text: "google/",
                  style:TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "guava")
            ]
          ),
        ),
        Text("Description Lorem Ipsum")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                _getAvatar(),
                SizedBox(width: 10.0,),
                _getRepoInfo(),
              ],
            ),
        ),
      ),
    );
  }

}