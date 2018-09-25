
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:trending_github/repo_model.dart';

String url = 'https://github-trending-api.now.sh/developers?language=java&since=daily';


Future<List<RepoList>> getRepositories() async {
  final response = await http.get(url,
    headers: {
      HttpHeaders.contentTypeHeader : 'application/json',
    },
  );
  print(response.statusCode.toString() + "repo github");
  return repoListFromJson(response.body);
}