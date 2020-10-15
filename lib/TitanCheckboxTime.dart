/*import 'package:flutter/material.dart';
class TitanCheckboxGroup extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<TitanCheckboxGroup>⁢ {

  bool _value = false;
  void _onChange(bool value)
  {
    setState(() {
      _value = value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Application"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>⁢[
     Checkbox(
         activeColor: Colors.redAccent,
         value: true,
         onChanged:(bool value){

           _onChange(value);
     }
     ),
     new Checkbox(
         activeColor: Colors.redAccent,
         value: true,
         onChanged:(bool value){

           _onChange(value);
     }
     ),
     new CheckboxListTile(
       title: new Text("Click me"),
         activeColor: Colors.green,
         value: _value,

         onChanged: (bool value)
     {
       _onChange(value);

     })

          ],
        ),

      ),

    );
  }
}*/