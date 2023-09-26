import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/models/article_model.dart';

class ArticlesRepository {
  ArticlesRepository({required this.remoteDataSource});

  final ArticlesRemoteDioDataSource remoteDataSource;

  Future<List<ArticleModel>> getArticlesForAuthorId(int authorId) async {
    final listDynamic = await remoteDataSource.getArticles();
    if (listDynamic == null) {
      return [];
    }
    return listDynamic.map((item) => ArticleModel.fromJson(item)).toList();
  }
}
