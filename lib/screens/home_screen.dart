import 'package:flutter/material.dart';
import 'package:test_app/screens/progressbar_screen.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  // List<String> loadingMessages = ['Téléchargement des données...', 'Presque fini...', 'Plus que quelques secondes...'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        backgroundColor: Colors.orangeAccent,
      ),
      body:  Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/9.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircularProgressIndicator(),
              const Text("Bienvenue Sur MyWeather !"
                  , style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  )),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProgressScreen()))
                },
                  child: const Text("Commencer",
                      style: TextStyle(fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}