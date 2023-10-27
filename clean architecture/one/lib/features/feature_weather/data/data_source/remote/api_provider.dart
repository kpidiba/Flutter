import 'package:dio/dio.dart';
import 'package:one/core/utils/constants.dart';

class ApiProvider {
  final _dio = Dio();
  var apiKey = Constants.apiKey;

  //current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get("${Constants.baseUrl}/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    print(response.data);
    return response;
  }
}
