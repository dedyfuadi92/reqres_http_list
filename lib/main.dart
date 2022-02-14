import 'package:flutter/material.dart';
import 'package:reqres_http_list/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = 'Tidak ada data';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GET LIST'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                output,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  User.getUser('2').then((users) {
                    output = '';
                    for (var i = 0; i < users.length; i++) {
                      output = output +
                          (i + 1).toString() +
                          '.) ' +
                          users[i].name +
                          '\n';
                    }
                    setState(() {});
                  });
                },
                child: Text('GET'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
