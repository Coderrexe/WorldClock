import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "../services/world_time.dart";

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: "London", flag: "britain.png", url: "Europe/London");
    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, "/home/", arguments: {
      "location": worldTime.location,
      "flag": worldTime.flag,
      "time": worldTime.time,
      "isDaytime": worldTime.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    this.setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 125.0,
        ),
      ),
    );
  }
}
