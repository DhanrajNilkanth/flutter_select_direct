import 'package:direct_select/direct_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'selectable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

 int index1 = 0, index2 = 0;

 final elements1 = [
   'Bike 1',
   'Bike number 2',
   'Bike 3',
   'Bike number 4',
   'Bike 5',
   'Bike number 6',
 ];
  

 final elements2 = [
   'Car 1',
   'Car number 2',
   'Car 3',
   'Car number 4',
   'Car 5',
   'Car number 6',
 ];


 List _buildItem1(){

   return elements1.map((e) => Selectable(title: e,)).toList();

 }

 List _buildItem2(){

   return elements2.map((e) => Selectable(title: e,)).toList();

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(0.0),
              child: Text('What Bike do you want........?',style: TextStyle(fontSize: 20.0),),
              ),
              DirectSelect(
                  items: _buildItem1(),
                  onSelectedItemChanged: (index){
                    setState(() {
                      index1 = index;
                    });
                  },
                  itemExtent: 60.0,
                  child:Selectable(
                    title: elements1[index1],
                    isForList: false,
                  ),
                mode: DirectSelectMode.tap,
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text('What Car do you want........?',style: TextStyle(fontSize: 20.0),),
              ),
              DirectSelect(
                items: _buildItem2(),
                onSelectedItemChanged: (index){
                  setState(() {
                    index2 = index;
                  });
                },
                itemExtent: 60.0,
                child:Selectable(
                  title: elements2[index2],
                  isForList: false,
                ),
                mode: DirectSelectMode.tap,
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}















