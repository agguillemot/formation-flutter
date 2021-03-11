class Weather {
  Weather({
    this.datehour,
    this.isSunny,
    this.temperature,
  });

  final String datehour;
  final bool isSunny;
  final double temperature;

  factory Weather.fromJson(datehour, Map<String, dynamic> json) {
    return Weather(
      isSunny: json[datehour]['pluie'] != 0.0,
      temperature: json[datehour]['temperature']['sol'],
    );
  }
}
