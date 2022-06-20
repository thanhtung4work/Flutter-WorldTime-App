import 'package:flutter/material.dart';
import 'package:international_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    // Asia
    WorldTime("Ho Chi Minh city", "vn-flag.gif", "asia/ho_chi_minh"),
    WorldTime("Tokyo", "jp-flag.gif", "asia/tokyo"),
    WorldTime("Shang Hai", "cn-flag.gif", "asia/shanghai"),
    WorldTime("Hong Kong", "hk-flag.gif", "asia/hong_kong"),
    WorldTime("Jakarta", "id-flag.gif", "asia/jakarta"),
    WorldTime("Seoul", "kr-flag.gif", "asia/seoul"),
    WorldTime("Dubai", "uae-flag.gif", "asia/dubai"),
    WorldTime("Bangkok", "th-flag.gif", "asia/bangkok"),
    WorldTime("Kolkata", "in-flag.gif", "asia/kolkata"),
    WorldTime("Jerusalem", "il-flag.gif", "asia/jerusalem"),

    // America
    WorldTime("Los Angeles", "us-flag.gif", "america/Los_Angeles"),
    WorldTime("New York", "us-flag.gif", "America/New_York"),
    WorldTime("Toronto", "ca-flag.gif", "america/Toronto"),
    WorldTime("Buenos Aires", "ar-flag.gif", "America/Argentina/Buenos_Aires"),
    WorldTime("Puerto Rico", "pr-flag.gif", "America/Puerto_Rico"),
    WorldTime("Costa Rica", "cr-flag.gif", "America/Costa_Rica"),
    WorldTime("Sao Paulo", "br-flag.gif", "America/Sao_Paulo"),
    WorldTime("Mexico City", "mx-flag.gif", "America/Mexico_City"),
    WorldTime("Jamaica", "jm-flag.gif", "America/Jamaica"),
    WorldTime("Caracas", "ve-flag.gif", "America/Caracas"),

    // Europe
    WorldTime("Madrid", "sp-flag.gif", "europe/Madrid"),
    WorldTime("Paris", "fr-flag.gif", "europe/Paris"),
    WorldTime("Berlin", "de-flag.gif", "europe/berlin"),
    WorldTime("Rome", "it-flag.gif", "europe/rome"),
    WorldTime("London", "gb-flag.gif", "europe/london"),
    WorldTime("Dublin", "ie-flag.gif", "Europe/Dublin"),
    WorldTime("Kiev", "ua-flag.gif", "Europe/Kiev"),
    WorldTime("Athens", "gr-flag.gif", "Europe/Athens"),
    WorldTime("Lisbon", "pt-flag.gif", "Europe/Lisbon"),
    WorldTime("Brussels", "br-flag.gif", "Europe/Brussels"),
    WorldTime("Amsterdam", "nl-flag.gif", "Europe/Amsterdam"),

    // Africa
    WorldTime("Nairobi", "ke-flag.gif", "Africa/Nairobi"),
    WorldTime("Lagos", "ng-flag.gif", "Africa/Lagos"),
    WorldTime("Algiers", "dz-flag.gif", "Africa/Algiers"),
    WorldTime("Cairo", "eg-flag.gif", "Africa/Cairo"),
    WorldTime("Casablanca", "ma-flag.gif", "Africa/Casablanca"),

  ];

  String flagFolder = "assets/flags/";

  void selectTime(int index) async{
    WorldTime instance = locations[index];
    await instance.getData();

    // navigate back to home screen
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flagUrl,
      "time": instance.timeString,
      "date": instance.dateString,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (){
                selectTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage(flagFolder+locations[index].flagUrl),
              ),
            )
          );
        },
      ),
    );
  }
}
