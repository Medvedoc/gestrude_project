import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double size;
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AnimatedBuilder(
                animation: _arrowAnimationController,
                builder: (context, child) => Transform.rotate(
                  angle: _arrowAnimation.value,
                  child: Icon(
                    Icons.expand_more,
                    size: 50.0,
                    color: Colors.black,
                  ),
                ),
                //  child:
              ),
              FlatButton(
                child: Text('Start Icon Animation'),
                onPressed: () {
                  _arrowAnimationController.isCompleted
                      ? _arrowAnimationController.reverse()
                      : _arrowAnimationController.forward();
                      size: 70.0;
                },
                splashColor: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
        size: 20.0;
  }
}
