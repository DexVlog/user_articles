import 'package:test/test.dart';
import 'package:user_articles/domain/models/author_model.dart';

void main() {
  test('should return first and second name combined', () {
    //1
    final model = AuthorModel(1, '', 'Kamil', 'Glik');
    //2
    final result = model.name;
    //3
    expect(result, 'Kamil Glik');
  });
}
