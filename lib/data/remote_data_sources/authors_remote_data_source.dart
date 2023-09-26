import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/author_model.dart';

part 'authors_remote_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/adamsmaka/json-demo")
abstract class AuthorsRemoteRetrofitDataSource {
  factory AuthorsRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _AuthorsRemoteRetrofitDataSource;

  @GET("/users")
  Future<List<AuthorModel>> getAuthor();
}


// class AuthorsRemoteDioDataSource {
  // Future<List<Map<String, dynamic>>?> getAuthors() async {
//     final response = await Dio().get<List<dynamic>>(
//         'https://my-json-server.typicode.com/adamsmaka/json-demo/users');

//     final listDynamic = response.data;
//     if (listDynamic == null) {
//       return null;
//     }
//     return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//   }
// }





// class AuthorsMockedDataSource {
//   Future<List<Map<String, dynamic>>?> getAuthors() async {
//     return [
//       {
//         'id': 1,
//         'picture': 'https://randomuser.me/api/portraits/men/57.jpg',
//         'first_name': 'Piotr',
//         'last_name': 'Obdarowicz',
//       },
//       {
//         'id': 2,
//         'picture': 'https://randomuser.me/api/portraits/men/58.jpg',
//         'first_name': 'Radosław',
//         'last_name': 'Gdański',
//       },
//     ];
//   }
// }

