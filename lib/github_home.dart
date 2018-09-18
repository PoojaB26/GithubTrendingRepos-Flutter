import 'package:flutter/material.dart';
import 'api_services.dart';
import 'repo_model.dart';

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
      body: FutureBuilder<RepoList>(
          future: getRepositories(),
          builder: (BuildContext context,  snapshot){
          if(snapshot.hasData){
            print(snapshot.data.repoList[0].username);
            return
              Container(
                child: ListView.builder(
                    itemCount: snapshot.data.repoList.length,
                    itemBuilder: (context, index){
                      return RepoCard(
                        repoItem: snapshot.data.repoList[index],
                      );
                    }),
              );
          }else if(snapshot.hasError){
            return Center(child: Text("Error"),);
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      })
    );
  }

}


class RepoCard extends StatelessWidget{

  final RepoListItem repoItem;
  RepoCard({
    this.repoItem
});
  


  @override
  Widget build(BuildContext context) {



    _getAvatar(){
      return CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(repoItem.avatar),
      );
    }

    _getRepoInfo(){
      return Expanded(
        child: Column(
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
                    TextSpan(text: '${repoItem.username}/',
                        style:TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "${repoItem.repos.name}")
                  ]
              ),
            ),
            Text(repoItem.repos.description)
          ],
        ),
      );
    }


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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