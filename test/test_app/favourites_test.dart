import 'package:flutter_codelab_study/test_app/models/favorites.dart';
import 'package:test/test.dart';

void main() {
  group('App Provider Tests', () {
    final favorites = Favorites();

    test('A new item should be added.', () {
      final number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });
  });
}
