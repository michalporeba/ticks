import 'package:rxdart/subjects.dart';
import 'package:ticks/entities/resource/resource.dart';
import 'package:ticks/entities/resource/resource_api.dart';

class ResourceRepository {

  ResourceRepository({
    required this.remoteApi,
  });

  final _subject = BehaviorSubject<List<Resource>>();

  final ResourceApi remoteApi;

  Stream<List<Resource>> getAll() {
    remoteApi
      .getAll()
      .then((resources) => _subject.sink.add(resources));

    return _subject.stream;
  }
}
