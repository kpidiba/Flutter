import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/exception.dart';
import 'package:practice02/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const BASE_URL = "https://jsonplaceholder.typicode.com";

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int id);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

class PostRemoteImplWithDio implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(PostModel postModel) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    throw UnimplementedError();
  }
}

class PostRemoteImplWithHttp implements PostRemoteDataSource {
  final http.Client client;
  PostRemoteImplWithHttp({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse("$BASE_URL/posts/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {"title": postModel.title, "body": postModel.body};

    final response =
        await client.post(Uri.parse("$BASE_URL/posts/"), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.post(
        Uri.parse("$BASE_URL/posts/${postId.toString()}"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {"title": postModel.title, "body": postModel.body};
    final response =
        await client.post(Uri.parse("$BASE_URL/posts/$postId"), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
