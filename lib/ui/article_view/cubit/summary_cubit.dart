import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wikipedia_reader/data/repository/RandomArticleRepository.dart';
import 'package:wikipedia_reader/summary.dart';

class SummaryCubit extends Cubit<Summary?> {
  final RandomArticleRepository _repo = RandomArticleRepository();
  SummaryCubit() : super(null);

  void updateState() async {
    return emit(await _repo.getRandomArticle());
  }
}