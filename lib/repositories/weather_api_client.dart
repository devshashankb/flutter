import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapplication/models/models.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  /* Function to retrieve Location Id with City as Input.
     Input  String City

   */
  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  /* Future<int> getLocationIdWithPosition(String latLong) async {
      final locationUrl = '$baseUrl/api/location/search/?lattlong=$latLong';
      final locationResponse = await this.httpClient.get(locationUrl);
      if (locationResponse.statusCode != 200) {
        throw Exception('error getting locationId for city');
      }

      final locationJson = jsonDecode(locationResponse.body) as List;
      // Prints the first entry related information.
      return (locationJson.first)['woeid'];
    } */

  /* Function to retrieve Weather with Location ID.

   */
  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
