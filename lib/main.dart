import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  AnimationController controller;
 bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Animated Icon"),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          iconSize: 150,
          splashColor: Colors.green,
          icon: AnimatedIcon(
            size: 150,
            icon: AnimatedIcons.play_pause,
            progress: controller,
            color: Colors.pink
          ),
          onPressed: togggleIcon,
        ),
      ),
    );
  }

  void togggleIcon() => setState((){
    isPlaying =  !isPlaying;
    isPlaying ? controller.forward() : controller.reverse();
  });

}

