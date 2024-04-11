import 'package:ticks/entities/checklist/checklist.dart';

class AppRepository {
  Future<Checklist?> getCurrentChecklist() async {
    await Future<Checklist>.delayed(const Duration(seconds: 1));
    return const Checklist(
      blueprintId: '1',
      title: 'Ambulance HK 105',
    );
  }
}
