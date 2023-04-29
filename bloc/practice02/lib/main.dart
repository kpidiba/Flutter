import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/core/app_theme.dart';
import 'package:practice02/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:practice02/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:practice02/features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<PostBloc>()),
          BlocProvider(create: (_) => di.sl<CrudBloc>())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            title: "My Bloc application",
            home: const PostPage()));
  }
}
