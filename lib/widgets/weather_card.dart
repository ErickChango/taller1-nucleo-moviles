import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final String country;
  final VoidCallback onDelete;

  const WeatherCard({
    Key? key,
    required this.city,
    required this.country,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherService weatherService = WeatherService();

    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: Icon(Icons.location_on, color: Colors.blue, size: 35),
        title: Text(
          '$city, $country',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: FutureBuilder<Map<String, dynamic>>(
          future: weatherService.getWeather(city),
          builder: (context, weatherSnapshot) {
            if (weatherSnapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text('Cargando clima...'),
              );
            }

            if (weatherSnapshot.hasError) {
              return Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'No se pudo cargar el clima',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            final weather = weatherSnapshot.data!;
            return Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🌡️ ${weather['temp']}°C',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '${weather['description']}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          },
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
