import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formation/Weather.dart';
import 'package:formation/fetchWeather.dart';

class WeatherPage extends StatefulWidget {
  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  Future<List<Weather>> futureWeather;

  @override
  void initState() {
    super.initState();

    futureWeather = fetchWeather();
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        TableCell(
          child: Text('heure'),
          verticalAlignment: TableCellVerticalAlignment.middle,
        ),
        TableCell(
          child: Text('temps'),
          verticalAlignment: TableCellVerticalAlignment.middle,
        ),
        TableCell(
          child: Text('température'),
          verticalAlignment: TableCellVerticalAlignment.middle,
        ),
      ],
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey),
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
    );
  }

  TableRow _buildRow(hour, weather) {
    final celsiusTemperature = weather.temperature - 273.15;

    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Text(hour),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: weather.isSunny
              ? Icon(Icons.cloud_outlined)
              : Icon(Icons.wb_sunny_outlined),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Text(celsiusTemperature.toStringAsFixed(2)),
        ),
      ],
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Icon(
            Icons.cloud_outlined,
            color: null,
          ),
          Text(' Météo'),
        ]),
      ),
      body: FutureBuilder<List<Weather>>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Table(
                  children: [
                    _buildTableHeader(),
                    _buildRow('10h', snapshot.data[0]),
                    _buildRow('16h', snapshot.data[1]),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
