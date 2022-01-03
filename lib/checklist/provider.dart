import 'dart:convert';
import 'package:ticks/checklist/checklist.dart';
import 'package:ticks/checklist/mapbuilders.dart';

abstract class ChecklistProvider {
  Checklist get(String id);
}

class SampleChecklistProvider extends ChecklistProvider {
  @override
  Checklist get(String id) {
    String data = '''
    {
      "id" : "35abdd55-bb69-4f90-ba43-3c78d615f184",
      "checks" : [
        { "id" : "a6087a1e-b73a-41b9-a3ae-f0c0f15dbb1c", "name": "First Check" },
        { "id" : "de30b788-2179-4682-bd46-839971c2aaef", "name": "Second Check" },
        { "id" : "56904b8e-4e8d-45f9-b139-e4fd4802984e", "name": "Third Check" },
        { "id" : "98e19e07-5ae0-4ef0-a4f9-fa949bcc09e9", "name": "Fourth Check" }
      ]
    }
    ''';
    return MapChecklistBuilder(data: jsonDecode(data)).build();
  }
}