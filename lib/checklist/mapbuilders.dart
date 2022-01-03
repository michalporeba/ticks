import 'check.dart';
import 'checklist.dart';

class MapChecklistBuilder extends ChecklistBuilder {
  final Map data;

  MapChecklistBuilder({required this.data});

  @override
  Checklist build() {
    id = data['id'].toString();
    checks = data.containsKey('checks')
        ? _makeChecks(data['checks'])
        : <Check>[];

    return Checklist(this);
  }

  List<Check> _makeChecks(List<dynamic> list) {
    List<Check> results = <Check>[];
    for(Map data in list) {
      results.add(MapSimpleCheckBuilder(data: data).build());
    }
    return results;
  }
}

class MapSimpleCheckBuilder extends SimpleCheckBuilder {
  final Map data;

  MapSimpleCheckBuilder({required this.data});

  @override
  SimpleCheck build() {
    id = data['id'];
    label = data['name'];
    checked = false;
    return SimpleCheck(this);
  }
}