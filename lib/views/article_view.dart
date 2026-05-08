import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../view_models/article_view_model.dart';
import '../widgets/article_widget.dart';
import '../summary.dart';

class ArticleView extends StatefulWidget {
  ArticleView({super.key});

  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final viewModel = ArticleViewModel(ArticleModel());

  @override
  void initState() {
    super.initState();
    viewModel.fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wikipedia")),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return switch ((viewModel.isLoading, viewModel.summary, viewModel.error)) {
              (true, _, _) => CircularProgressIndicator(),
              (_, _, Exception e) => Text('Error: $e'),
              (_, Summary summary?, _) => ArticlePage(summary: summary, nextArticle: viewModel.fetchArticle),
              _ => Text("Something went wrong"),
            };
          }
        ),
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  final Summary summary;
  final VoidCallback nextArticle;

  const ArticlePage({super.key, required this.summary, required this.nextArticle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column(
        children: [
          ArticleWidget(summary: summary),
          ElevatedButton(
            onPressed: nextArticle, 
            child: Text('Next random article')
          )
        ],
      ),
    );
  }
}