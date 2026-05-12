import '../../summary.dart';
import '../service/RandomArticleService.dart';


class RandomArticleRepository {
  final _randomArticleService = RandomArticleService();

  Future<Summary> getRandomArticle() async {
    final data = await _randomArticleService.getRandomArticle();
    return Summary.fromJson(data);
  }
}