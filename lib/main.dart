import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wikipedia_reader/ui/article_view/cubit/artice_cubit.dart';
import 'package:wikipedia_reader/ui/article_view/widgets/articlePage_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ArticleCubit(),
        child: const ArticlePageScreen(),
      ),
    );
  }
}