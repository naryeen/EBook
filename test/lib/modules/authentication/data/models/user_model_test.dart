import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo/cores/utils/typedef.dart';
import 'package:todo/modules/authentication/data/models/user_model.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';

import '../../../../../fixtures/fixtures_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be a subclass of [User] entity', () {
    // arrange
    // assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      // acting, action
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });
  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
      // acting, action
      //
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  // final result = tModel.toMap();
  group('toMap', () {
    test('should return a [Map] with the right data', () {
      // acting, action
      final result = tModel.toMap; // Change this line
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] String with the right data', () {
      // acting, action

      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "avatar": "_empty.avatar",
        "createdAt": "_empty.createdAt",
        "name": "_empty.name"
      });
      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a [UserModel] String with the right data', () {
      // acting, action
      final result = tModel.copyWith(name: 'Naryeen');
      expect(result.name, equals('Naryeen'));
    });
  });
}
