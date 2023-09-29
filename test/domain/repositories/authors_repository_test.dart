import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';

class MockAuthorsDataSource extends Mock
    implements AuthorsRemoteRetrofitDataSource {}

void main() {
  late AuthorsRepository sut;
  late MockAuthorsDataSource authorsDataSource;
  setUp(() {
    authorsDataSource = MockAuthorsDataSource();
    sut = AuthorsRepository(remoteDataSource: authorsDataSource);
  });

  group('get', () {
    test(
        'should fetch author models from mock and return expected author models',
        () async {
      //1
      when(() => authorsDataSource.getAuthors()).thenAnswer((_) async => [
            AuthorModel(1, 'picture1', 'Paweł', 'Skoczek'),
            AuthorModel(2, 'picture2', 'Adrian', 'Karolak'),
            AuthorModel(3, 'picture3', 'Kacper', 'Winiarski'),
            AuthorModel(4, 'picture4', 'Michał', 'Maciaszek'),
          ]);
      //2
      final result = await sut.getAuthorModels();
      //3
      expect(result, [
        AuthorModel(1, 'picture1', 'Paweł', 'Skoczek'),
        AuthorModel(2, 'picture2', 'Adrian', 'Karolak'),
        AuthorModel(3, 'picture3', 'Kacper', 'Winiarski'),
        AuthorModel(4, 'picture4', 'Michał', 'Maciaszek'),
      ]);
    });
  });



  test('Should call remoteDataSource.getAuthors() method', () async {
    //1
    when(() => authorsDataSource.getAuthors()).thenAnswer((_) async => []);
    //2
    sut.getAuthorModels();
    //3
    verify(() => authorsDataSource.getAuthors()).called(1);
  });
}