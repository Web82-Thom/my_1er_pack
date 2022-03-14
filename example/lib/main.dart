import 'package:flutter/material.dart';
import 'package:my_1er_pack/my_1er_pack.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
      string: "Version android & IOS", 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Adaptive.text(string:" ${Adaptive.isIOS()}", color: Colors.red),
          Adaptive.button(
            child: Adaptive.text(string:"Press Me"), 
            onPressed: (){
              Adaptive.alert(context: context,callback: (){
                print("Succes");
                Navigator.of(context).pop();
              });
            } 
          )

        
          ],
        )
      ));
  }
}
