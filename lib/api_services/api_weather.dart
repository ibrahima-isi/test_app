import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_data.dart';

class WeatherService {
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherData> getWeather(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Body: 💋💋💋💋💋💋💋${response.body}");
      Map<String, dynamic> data = jsonDecode(response.body);
      data['city'] = city;
      print("Body: 💋💋💋💋💋💋💋${data['city']}");

      return WeatherData.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
