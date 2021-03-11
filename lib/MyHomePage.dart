import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formation/Battery.dart';
import 'package:formation/MyImages.dart';
import 'package:formation/RandomWords.dart';
import 'package:formation/Roads.dart';
import 'package:formation/WeatherPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  })  : assert(title != null),
        super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void _goToRandowWords() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return RandomWords();
          },
        ),
      );
    }

    void _goToImages() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return MyImages(
              images: [
                'https://cdn.mos.cms.futurecdn.net/6h8C6ygTdR2jyyUxkALwsc-1200-80.jpg',
                'https://images-eu.ssl-images-amazon.com/images/I/91dYFuM4xfL.png',
                'https://upload.wikimedia.org/wikipedia/commons/1/1a/Donkey_in_Clovelly%2C_North_Devon%2C_England.jpg',
                'https://s3.amazonaws.com/assets.farmsanctuary.org/content/uploads/2018/12/27061639/albert-header-2016-02-08_FSOR_Albert_DSC3240_CREDIT_Farm_Sanctuary-1-e1590885908701-1600x804.jpg',
              ],
            );
          },
        ),
      );
    }

    void _goToWeather() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return WeatherPage();
          },
        ),
      );
    }

    void _goToBattery() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Battery();
          },
        ),
      );
    }

    void _goToRoads() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Roads();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _goToRandowWords, child: Icon(Icons.translate)),
            ElevatedButton(onPressed: _goToImages, child: Icon(Icons.image)),
            ElevatedButton(
                onPressed: _goToWeather, child: Icon(Icons.cloud_outlined)),
            ElevatedButton(
                onPressed: _goToBattery, child: Icon(Icons.battery_alert)),
            ElevatedButton(
                onPressed: _goToRoads, child: Icon(Icons.directions)),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
