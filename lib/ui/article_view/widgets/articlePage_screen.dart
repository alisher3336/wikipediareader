import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wikipedia_reader/ui/article_view/cubit/artice_cubit.dart';
import 'article_page.dart';

class ArticlePageScreen extends StatelessWidget {
  const ArticlePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wikipedia")),
      body: Center(
        child: BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, state) {
            return switch (state) {
              ArticleLoading() => CircularProgressIndicator(),
              ArticleError(error: var e) => Text('Error: $e'),
              ArticleLoaded(summary: var summary) => ArticlePage(
                summary: summary,
                nextArticle: context.read<ArticleCubit>().updateArticle,
              ),
              ArticleInitial() => Text("Initial State"),
              _ => Text("Something went wrong"),
            };
          },
        ),
      ),
    );
  }
}