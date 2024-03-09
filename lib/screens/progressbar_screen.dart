import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/api_services/api_weather.dart';
import 'package:test_app/models/weather_data.dart';
import 'package:test_app/screens/city_details_screen.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProgressScreen();
}

class _ProgressScreen extends State<ProgressScreen> {
  List<String> loadingMessages = [
    'Téléchargement des données...',
    'Presque fini...',
    'Plus que quelques secondes...'
  ];
  List<String> cities = ["Rennes", "Paris", "Lyon", "Marseille", "Nice"];
  int indexCity = 0;
  List<WeatherData> weatherDatas = [];

  int currentIndex = 0;
  double progress = 0.0;
  Timer? timerRequest;
  Timer? timerProgress;
  // String apiKey = 'dc8ed27ede29eef77547b333c2b0de3c';

  WeatherService weatherService =
      WeatherService('dc8ed27ede29eef77547b333c2b0de3c');

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 6), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % loadingMessages.length;
      });
    });
    init();
  
  }

void init() {
    timerProgress = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (progress >= 1.0) {
        timerProgress?.cancel();
         return;
      }
      setState(() {
        progress += 0.033;
      });
    });
    timerRequest = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (indexCity > 4) {
        timerRequest?.cancel();
        return;
      }
      String city = cities[indexCity];
      _fetchData(city)
          .then((weatherData) => {
                setState(() {
                  weatherDatas.add(weatherData);
                })
              })
          .catchError((e) => {print("Error: 😂😂😂😂😂😂 $e")});
      setState(() {
        indexCity += 1;
      });
    });
}

// fetching data function
  Future<WeatherData> _fetchData(String city) async {
    print("object ✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔");

    WeatherData weatherData = await weatherService.getWeather(city);
    print("data : 😍 ${weatherData.toJson()}");
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chargement'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/2.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(loadingMessages[currentIndex],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 8.0),
                child: progress < 1 ? LinearProgressIndicator(
                  value: progress,
                  color: Colors.tealAccent,
                  minHeight: 20,
                ) :
                ElevatedButton(onPressed: () => {
                  progress = 0,
                  indexCity = 0,
                  weatherDatas.clear(),
                  // timerRequest?.cancel(),
                  // timerProgress?.cancel(),
                  init()
                },
                  child: const Text("Recommencer",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.tealAccent
                          )
                  )
              ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    weather: weatherDatas[index],
                                  )
                                ),
                        );
                      },
                      child: ListTile(
                          title: Text(
                            weatherDatas[index].city ,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 20,
                            )
                          ),
                          subtitle: Text(
                            "${weatherDatas[index].heat}°C",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            )
                          ),
                          trailing: Text(
                            "${weatherDatas[index].clouds}%",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 14,
                            )
                          )),
                    );
                  },
                  itemCount: weatherDatas.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
