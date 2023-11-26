import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/bloc/news_bloc_state.dart';
import 'package:news/common/constants.dart';
import 'package:news/router/router.dart';
import 'package:news/ui/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade400,
        ),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().config(),

    );
  }
}
