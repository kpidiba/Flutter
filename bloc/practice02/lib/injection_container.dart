import 'package:practice02/features/posts/data/datasourcces/post_local_data_source.dart';
import 'package:practice02/features/posts/data/datasourcces/post_remote_data_source.dart';
import 'package:practice02/features/posts/data/repositories/post_repository_implem.dart';
import 'package:practice02/features/posts/domain/usecases/add_post.dart';
import 'package:practice02/features/posts/domain/usecases/delete_post.dart';
import 'package:practice02/features/posts/domain/usecases/get_all_post.dart';
import 'package:practice02/features/posts/domain/usecases/update_post.dart';
import 'package:practice02/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:practice02/features/posts/presentation/bloc/post/post_bloc.dart';

import 'core/network/network_info.dart';
import 'features/posts/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => PostBloc(getAllPosts: sl(),));
  sl.registerFactory(() => CrudBloc(
      addPostUseCase: sl(), updatePostUseCase: sl(), deletePostUseCase: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));

// Repository

  sl.registerLazySingleton<PostsRepository>(() => PostRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteImplWithHttp(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}