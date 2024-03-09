class WeatherData {
  final String city;
  final double heat;
  final int clouds;

  const WeatherData({
    required this.city,
    required  this.heat,
    required this.clouds
});

  WeatherData.fromJson(Map<String, dynamic> json):
      city = json['city'],
      heat = json['main']['temp'],
      clouds = json['clouds']['all'];

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['heat'] = heat;
    data['clouds'] = clouds;
    return data;
  }
}