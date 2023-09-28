import 'package:injectable/injectable.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';

@injectable
class AuthorsRepository {
  AuthorsRepository({required this.remoteDataSource});

  final AuthorsRemoteRetrofitDataSource remoteDataSource;

  Future<List<AuthorModel>> getAuthorModels() async {
    return remoteDataSource.getAuthor();
  }
}

//   Future<List<AuthorModel>> getAuthorModels() async {
//     final getAuthorModels = await remoteDataSource.getAuthors();
//     if (getAuthorModels == null) {
//       return [];
//     }
//      return getAuthorModels.map((item) => AuthorModel.fromJson(item)).toList();
//   }
// }
