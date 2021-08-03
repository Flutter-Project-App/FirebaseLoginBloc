import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    const id = 'mock-id';
    const email = 'mock-email';

    test('User value equality', () {
      expect(User(id: id, email: email, name: null, photo: null),
          User(id: id, email: email, name: null, photo: null));
    });

    test('isEmpty returns true for empty user', () {
      expect(User.empty.isEmpty, isTrue);
    });

    test('isEmpty returns false for non-empty user', () {
      final user = User(id: id, email: email, name: null, photo: null);
      expect(user.isEmpty, isFalse);
    });

    test('isNotEmpty returns false for empty user', () {
      expect(User.empty.isNotEmpty, isFalse);
    });

    test('isNotEmpty returns true for empty user', () {
      final user = User(id: id, email: email, name: null, photo: null);
      expect(User.empty.isNotEmpty, isTrue);
    });
  });
}
