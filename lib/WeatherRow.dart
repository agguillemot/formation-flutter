import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherRow extends StatefulWidget {
  WeatherRow({
    Key key,
    this.hour,
    this.isSunny,
    this.temperature, // in K
  }) : super(key: key);

  final String hour;
  final bool isSunny;
  final double temperature;

  @override
  _WeatherRowState createState() => _WeatherRowState();
}

class _WeatherRowState extends State<WeatherRow> {
  @override
  Widget build(BuildContext context) {
    final celsiusTemperature = widget.temperature - 273.15;

    return Row(
      children: [
        Text(widget.hour),
        widget.isSunny
            ? Icon(Icons.cloud_outlined)
            : Icon(Icons.wb_sunny_outlined),
        Text(celsiusTemperature.toStringAsFixed(2)),
      ],
    );
  }
}
