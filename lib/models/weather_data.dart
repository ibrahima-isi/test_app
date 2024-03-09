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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['heat'] = this.heat;
    data['clouds'] = this.clouds;
    return data;
  }
}