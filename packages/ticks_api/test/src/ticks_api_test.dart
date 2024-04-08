// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:ticks_api/src/model/blueprint.dart';
import 'package:ticks_api/src/model/checklist.dart';

void main() {
  group('Blueprint', () {
    test('can be instantiated', () {
      expect(Blueprint(title: 'test'), isNotNull);
    });
  });
  group('Checklist', () {
    test('can be instantiated', () {
      const blueprint = Blueprint(title: 'test');
      expect(Checklist(blueprintId: blueprint.id, title: 'test'), isNotNull);
    });
  });
}
