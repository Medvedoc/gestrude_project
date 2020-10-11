import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:gestrude_project/buttonWidget.dart';
import 'package:gestrude_project/mainBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyWork"),
        ),
        body: ExtendedMenuWidget(),
        //ButtonWidget(),
      ),
    );
  }
}

class ExtendedMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _getButtonWidget(
              context, MainState.words[MainState.button1], MainState.button1),
          _getButtonWidget(
              context, MainState.words[MainState.button2], MainState.button2),
          _getButtonWidget(
              context, MainState.words[MainState.button3], MainState.button3),
          // ButtonWidget(text: 'button1', warningNumber: 3, style: myStyle),
//ButtonWidget(text: 'button2', warningNumber: 0, style: myStyle),
//ButtonWidget(text: 'button3', style: myStyle),
        ],
      ),
    );
  }

  Widget _getButtonWidget(BuildContext context, String text, int state) {
    return Container(
      child: FlatButton(
        onPressed: () {
          //BlocProvider.of<MainBloc>(context).add(MainPageEvent(state));
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
          maxLines: 2,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),

      //color: Colors.teal[100],
    );
  }
}
