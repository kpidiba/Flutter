import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/exception.dart';
import 'package:practice02/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const DATA = "CACHE_POSTS";

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachePosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>((postModels) => postModels.toJson())
        .toList();
    sharedPreferences.setString(DATA, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachePosts() {
    final jsonString = sharedPreferences.getString(DATA);
    if (jsonString == null) {
      List decodeJsonData = json.decode(jsonString!);
      List<PostModel> jsonToPostModels = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
