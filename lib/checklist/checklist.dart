import 'check.dart';

class Checklist {
  final String id;
  final List<Check> checks;

  Checklist(ChecklistBuilder builder) :
      id = builder.id,
      checks = builder.checks;
}

abstract class ChecklistBuilder {
  late String id;
  late List<Check> checks;

  Checklist build();
}