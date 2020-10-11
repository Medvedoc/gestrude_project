import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Show Hide View on Button Click"),
          ),
          body: SafeArea(
              child: Center(
            child: ViewWidget(),
          ))),
    );
  }
}

class ViewWidget extends StatefulWidget {
  @override
  ViewWidgetState createState() => ViewWidgetState();
}

class ViewWidgetState extends State {
  bool viewVisible = true;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: viewVisible,
            child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
                margin: EdgeInsets.only(top: 50, bottom: 30),
                child: Center(
                    child: Text('Show Hide Text View Widget in Flutter',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 23))))),
        RaisedButton(
          child: Text('Hide Widget on Button Click'),
          onPressed: hideWidget,
          color: Colors.pink,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
        RaisedButton(
          child: Text('Show Widget on Button Click'),
          onPressed: showWidget,
          color: Colors.pink,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
        ExpansionTile(
          title: Container(
            color: Colors.green,
            child: Row(children: <Widget>[
              Text(
                'dddd',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),Text(
                'rrr',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              ],
            ),
          ),
          children: <Widget>[
            new Container(
              height: 60.0,
              margin: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            new Container(
              height: 60.0,
              margin: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 0.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.all(Radius.circular(5.0)),
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        SizedBox(height:10.0),
        
        ExpansionTile(
          title: Container(
            color: Colors.green,
            child: Row(children: <Widget>[
              Text(
                'qqq',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),Text(
                'www',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              ],
            ),
          ),
          children: <Widget>[
            new Container(
              height: 60.0,
              margin: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            new Container(
              height: 60.0,
              margin: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 0.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.all(Radius.circular(5.0)),
              ),
            )
          ],
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}
