import 'package:FlutterDemo/api/dataApi.dart';
import 'package:FlutterDemo/model/Records.dart';
import 'package:rxdart/rxdart.dart';

class TestDataBloc {
  final DataApi _dataApi = DataApi();

  BehaviorSubject<List<Record>> _record = BehaviorSubject<List<Record>>();

  getTestDart() async {
    Records response = await _dataApi.getTestData();
    _record.sink.add(response.data.records);
  }

  dispose() {
    _record.close();
  }

  BehaviorSubject<List<Record>> get subject => _record;
}

final testDataBloc = TestDataBloc();
