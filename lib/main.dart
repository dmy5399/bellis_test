import 'package:bellis_test/data/repositories/news_repository.dart';
import 'package:bellis_test/presentation/bloc/news/news_bloc.dart';
import 'package:bellis_test/presentation/bloc/saved/saved_bloc.dart';
import 'package:bellis_test/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (BuildContext context) => NewsBloc(NewsRepository()),
        ),
        BlocProvider<SavedBloc>(
          create: (BuildContext context) => SavedBloc(NewsRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
