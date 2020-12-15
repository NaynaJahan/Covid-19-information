import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'my_folder_other_files/other_file.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  //Color color = Colors.red;
  int confirmed = 0;
  int recovered = 0;
  int deaths = 0;
  int active = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        centerTitle: true,
        title: Text(
          "Covid 19 Info bd",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Center(
              child: Text(
                "Latest Covid 19 info of Bangladesh",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[900],
              child: Container(
                height: 200,
                child: Center(
                  child: Text(
                    "Total cases : $confirmed",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.red[300],
              child: Container(
                height: 200,
                child: Center(
                  child: Text(
                    "Active cases : $active",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[700],
              child: Container(
                height: 200,
                child: Center(
                  child: Text(
                    "Total deaths : $deaths",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.red[400],
              child: Container(
                height: 200,
                child: Center(
                  child: Text(
                    "Total recovered : $recovered",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          //covidData(),
        ],
      ),
    );
  }

  getData() async {
    print("I m getting data");
    final response =
        await http.get('https://covid19.mathdro.id/api/countries/BD');

    if (response.statusCode == 200) {
      print("data received");
      Map<String, dynamic> data = jsonDecode(response.body);
      // Map<dynamic, dynamic> dataInMap = data[0];
      setState(() {
        //active = data['active'];
        deaths = data['deaths']['value'];
        confirmed = data['confirmed']['value'];
        recovered = data['recovered']['value'];
      });
    } else {
      throw Exception('Failed to load album');
    }
  }
}
