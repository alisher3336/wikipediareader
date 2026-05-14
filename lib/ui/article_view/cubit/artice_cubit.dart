import 'package:bloc/bloc.dart';
import 'package:wikipedia_reader/data/repository/RandomArticleRepository.dart';
import 'package:wikipedia_reader/summary.dart';

class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleError extends ArticleState {
  Exception error;

  ArticleError(this.error);
}

class ArticleLoaded extends ArticleState {
  final Summary summary;

  ArticleLoaded(this.summary);
}

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial()) {
    updateArticle();
  }

  final RandomArticleRepository _repo = RandomArticleRepository();

  void updateArticle() async {
    emit(ArticleLoading());
    try {
      final article = await _repo.getRandomArticle();
      emit(ArticleLoaded(article));
    } on Exception catch (e) {
      emit(ArticleError(e));
    }
  }
}
