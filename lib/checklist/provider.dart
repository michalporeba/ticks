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
        { "id" : "98e19e07-5ae0-4ef0-a4f9-fa949bcc09e9", "name": "Fourth Check" },
        { "id" : "73013ec6-0c4b-4621-b842-bca1a4f5b361", "name": "Fifth Check" },
        { "id" : "66d36819-c98c-48b3-af26-701657923c8a", "name": "Sixth Check" },
        { "id" : "a4f3b9f4-8f7a-4c02-b363-81ad66ca6a78", "name": "Seventh Check" },
        { "id" : "1a55b37f-4223-4996-9c6a-41bbb305f476", "name": "Eight Check" },
        { "id" : "58382e94-e145-42ff-bb18-98c804e0a122", "name": "Ninth Check" },
        { "id" : "b5a46e5b-3dbf-46f3-acee-34bfd1ece7d2", "name": "Tenth Check" },
        { "id" : "12592421-7a65-488e-b76a-7e8ff63e0b1c", "name": "Eleventh Check" },
        { "id" : "fa43c005-30b1-4f86-9253-af4d35ae44d0", "name": "Twelfth Check" },
        { "id" : "18d7739f-7232-495b-82f6-3393788cd2ea", "name": "Thirteenth Check" },
        { "id" : "4f4481de-93af-47f1-b9d0-e3702f1f2f50", "name": "Fourteenth Check" },
        { "id" : "31e25a7b-0617-4bcf-b0c4-5a638f98cd12", "name": "Fifteenth Check" },
        { "id" : "e54b0ea1-6de6-40ce-af0d-76ad81e50368", "name": "Sixteenth Check" },
        { "id" : "94ac3113-978b-4659-b0a2-8eb6578f1b97", "name": "Seventeenth Check" },
        { "id" : "0ff90983-766e-4720-ac38-787b6d1a6379", "name": "Eighteenth Check" }               
      ]
    }
    ''';
    return MapChecklistBuilder(data: jsonDecode(data)).build();
  }
}