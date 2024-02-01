import 'package:http/http.dart' as http;

class ApiBaseHelper {

  late String _baseUrl;
  late String responseJson;

  ApiBaseHelper({String? baseUrl}) {
    _baseUrl = baseUrl ?? 'https://pokeapi.co/api/v2/';
  }

  Future<dynamic> get(String url) async {

    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on Exception {
      print('Error Fetching Data');
    }
    return responseJson;

  }
  
  String _returnResponse(response) {
    return response.body.toString();
  }

}
