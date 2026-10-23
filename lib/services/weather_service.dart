import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String _apiKey = 'a2c57ed3d60c62c0d4998da07d4c8254a';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> getWeather(String city) async {
    try {
      final url = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric&lang=es');
      
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        return {
          'temp': data['main']['temp'].round(),
          'description': data['weather'][0]['description'],
          'humidity': data['main']['humidity'],
          'windSpeed': data['wind']['speed'].toString(),
        };
      } else {
        throw Exception('Error al obtener el clima');
      }
    } catch (e) {
      throw Exception('No se pudo conectar con el servicio del clima');
    }
  }
}
