import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  late ArticlesRepository sut;
  late MockArticlesDataSource articlesDataSource;
  setUp(() {
    articlesDataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: articlesDataSource);
  });

  group('get', () {
    test('', () async {
      //1
      when(() => articlesDataSource.getArticles()).thenAnswer((_) async => [
            ArticleModel(1, 555, 'content1', 'picture1'),
            ArticleModel(2, 555, 'content2', 'picture2'),
            ArticleModel(3, 333, 'content3', 'picture3'),
            ArticleModel(4, 555, 'content4', 'picture4'),
          ]);
      //2
      final result =await sut.getArticlesForAuthorId(555);
      //3
      expect(result, [
        ArticleModel(1, 555, 'content1', 'picture1'),
        ArticleModel(2, 555, 'content2', 'picture2'),
        ArticleModel(4, 555, 'content4', 'picture4'),
      ]);
    });
  });
}
