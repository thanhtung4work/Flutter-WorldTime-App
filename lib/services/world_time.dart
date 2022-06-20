
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  // name of the location
  late String location;

  // result string of the time
  late String timeString;

  // result string of the date
  late String dateString;

  // url to the nation flag
  late String flagUrl;

  // url which leads to the api (europe/london, asia/ho_chi_minh, ...)
  late String apiUrlString;

  // daytime?
  late bool isDaytime;

  static const String API = "https://worldtimeapi.org/api/timezone/";

  WorldTime(this.location, this.flagUrl, this.apiUrlString);

  Future<void> getData() async {
    try {
      // make request
      apiUrlString = API + apiUrlString;
      Response response = await get(Uri.parse(apiUrlString));
      Map data = jsonDecode(response.body);

      // get properties from data
      String dateTime = data['utc_datetime'];
      String offset = data['utc_offset'];
      offset = offset.substring(0, 3);

      // create DateTime obj
      DateTime requestedTime = DateTime.parse(dateTime);
      requestedTime = requestedTime.add(Duration(hours: int.parse(offset)));

      // date
      int day = requestedTime.day;
      int month = requestedTime.month;
      int year = requestedTime.year;
      dateString = "$day-$month-$year";

      // time
      isDaytime = (requestedTime.hour >= 6 && requestedTime.hour < 19) ? true : false;
      timeString = DateFormat.jm().format(requestedTime);
    } catch (e) {
      timeString = "unavailable to get data";
      print("caught error: $e");
    }
  }
}