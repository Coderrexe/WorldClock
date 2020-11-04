import "package:http/http.dart";
import "package:intl/intl.dart";
import "dart:convert";

class WorldTime {
  String location; // location name for the UI
  String time; // the time in the given location
  String flag; // URL to a country flag icon of the given location
  String url; // location url for API endpoint
  bool isDaytime; // true if daytime, false if nighttime

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make a request for World Time API
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(0, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      this.isDaytime = now.hour > 6 && now.hour < 18;

      this.time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error: $e");
      
      this.isDaytime = false;
      this.time = "No Internet connection";
    }
  }
}
