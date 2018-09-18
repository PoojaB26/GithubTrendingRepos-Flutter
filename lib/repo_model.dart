class RepoList{
  List<RepoListItem> repoList;

  RepoList({
    this.repoList,
});

  factory RepoList.fromJson(List<dynamic> json){

    List<RepoListItem> repos = new List<RepoListItem>();
    repos = json.map((i)=>RepoListItem.fromJson(i)).toList();
    return RepoList(
      repoList: repos
    );
  }

}


class RepoListItem{
  String username;
  String avatar;
  Repo repos;

  RepoListItem({
    this.username,
    this.avatar,
    this.repos,
  });

  factory RepoListItem.fromJson(Map<String, dynamic> json) {

    return new RepoListItem(
        username: json['username'],
        avatar: json['avatar'],
        repos: Repo.fromJson(json['repo'])
    );
  }
}


class Repo{
  String name;
  String description;

  Repo({
    this.name,
    this.description
});

  factory Repo.fromJson(Map<String, dynamic> json){
    return new Repo(
      name: json['name'],
      description: json['description']
    );
  }
}