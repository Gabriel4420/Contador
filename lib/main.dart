import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String infoText = "Pode Entrar";
  int _people = 0;

  void changePeople(int delta) {
    setState(() {
      _people += delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
          filterQuality: FilterQuality.low,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Pessoas: $_people',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text('+1',
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  onPressed: () {
                    changePeople(1);
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text('-1',
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  onPressed: () {
                    changePeople(-1);
                  }),
            ),
          ]),
          if (_people <= 10)
            Text('${_people < 0 ? 'Mundo Invertido' : infoText}',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          else
            Text('Lotado',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)),
        ])
      ],
    );
  }
}
