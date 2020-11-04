import "package:flutter/material.dart";
import "../services/world_time.dart";

class ChooseLocationPage extends StatefulWidget {
  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  List<WorldTime> locations = [
    WorldTime(location: "London", flag: "uk.png", url: "Europe/London"),
    WorldTime(location: "Beijing", flag: "china.png", url: "Asia/Hong_Kong"),
    WorldTime(location: "Paris", flag: "france.png", url: "Europe/Paris"),
    WorldTime(location: "New York", flag: "usa.png", url: "America/New_York"),
    WorldTime(location: "Moscow", flag: "russia.jpg", url: "Europe/Moscow"),
    WorldTime(location: "Madrid", flag: "spain.png", url: "Europe/Madrid"),
    WorldTime(location: "Sydney", flag: "australia.png", url: "Australia/Sydney"),
  ];

  void updateTime(int index) async {
    WorldTime worldTime = this.locations[index];
    await worldTime.getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(this.locations[index].location);
                },
                title: Text(this.locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/flags/${this.locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
