import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wikipedia_reader/data/repository/RandomArticleRepository.dart';
import '../../../summary.dart';

class ArticleViewModel extends ChangeNotifier {
  final RandomArticleRepository repo;
  Summary? summary;
  Exception? error;
  bool isLoading = false;

  ArticleViewModel(this.repo) {
    fetchArticle();
  }
  
  Future<void> fetchArticle() async {
    isLoading = true;
    notifyListeners();
    try {
      summary = await repo.getRandomArticle();
      error = null;
    } on HttpException catch (e) {
      error = e;
      summary = null;
    }
    isLoading = false;
    notifyListeners();
  }
}