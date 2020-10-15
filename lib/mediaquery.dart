import 'package:flutter/material.dart';
Timer(Duration(milliseconds: 100), () {}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ZoomPage(),
      home: SizePositionPage(),
    );
  }
}

class SizePositionPage extends StatefulWidget {
  @override
  _SizePositionPageState createState() => _SizePositionPageState();
}

class _SizePositionPageState extends State<SizePositionPage> {
  final GlobalKey _cardKey = GlobalKey();
  final GlobalKey _cardKey2 = GlobalKey();
  Size cardSize;
  Offset cardPosition;
  Size cardSize2;
  Offset cardPosition2;
  final GlobalKey _cardKey3 = GlobalKey();
  Size cardSize3;
  Offset cardPosition3;

  final GlobalKey _cardKey4 = GlobalKey();
  Size cardSize4;
  Offset cardPosition4;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
    cardSize = _cardBox.size;
    cardPosition = _cardBox.localToGlobal(Offset.zero);
    print(cardSize);
    print(cardPosition);

    RenderBox _cardBox2 = _cardKey2.currentContext.findRenderObject();
    cardSize2 = _cardBox2.size;
    cardPosition2 = _cardBox2.localToGlobal(Offset.zero);
    print(cardSize2);
    print(cardPosition2);

    RenderBox _cardBox3 = _cardKey3.currentContext.findRenderObject();
    cardSize3 = _cardBox3.size;
    cardPosition3 = _cardBox3.localToGlobal(Offset.zero);
    print(cardSize3);
    print(cardPosition3);

    RenderBox _cardBox4 = _cardKey4.currentContext.findRenderObject();
    cardSize4 = _cardBox4.size;
    cardPosition4 = _cardBox4.localToGlobal(Offset.zero);
    print(cardSize4);
    print(cardPosition4);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Position"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 330.0,
            width: 330.0,
            color: Colors.red,
            key: _cardKey2,
            child: Column(
              children: [
                Text("Size - $cardSize2 : Position - $cardPosition2 "),
                Container(
                  height: 100.0,
                  width: 200.0,
                  color: Colors.green,
                  key: _cardKey3,
                  child: Column(
                    children: [
                      Text("Size - $cardSize3 : Position - $cardPosition3 "),
                      Container(
                        height: 60.0,
                        width: 180.0,
                        color: Colors.white,
                        key: _cardKey4,
                        child: Column(
                          children: [
                            Text(
                                "Size - $cardSize4 : Position - $cardPosition4 "),
                            /*Container(
                              height: 50.0,
                              width: 100.0,
                              color: Colors.green,
                              key: _cardKey4,
                              child: Column(
                                children: [
                                  Text(
                                      "Size - $cardSize4 : Position - $cardPosition4 "),
                                ],
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome to MTECHVIRAL",
                    key: _cardKey,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Find Size & Position of a Widget",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Text("Size - $cardSize"),
          Text("Position - $cardPosition "),
        ],
      ),
    );
  }
}