// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:ticks_api/src/model/blueprint.dart';

void main() {
  group('Blueprint', () {
    test('can be instantiated', () {
      expect(Blueprint(title: "test"), isNotNull);
    });
  });
}
