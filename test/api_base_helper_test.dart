
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {

  group('ApiBaseHelper', () {

    test('returns response if the http call completes successfully', () async {
     
    });

    test('throws an exception if the http call completes with an error', () async {
    
    });

  });
  
}