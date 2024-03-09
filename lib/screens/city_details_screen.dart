import 'package:flutter/material.dart';
import 'package:test_app/models/weather_data.dart';

class DetailScreen extends StatelessWidget {
  final WeatherData weather;
  const DetailScreen({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/1.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Ville :${weather.city}, France",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  )),
              const SizedBox(height: 40),
              Text("Temperature : ${weather.heat}°F",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  )),
              const SizedBox(height: 20),
              Text("Nuage : ${weather.clouds}%",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
