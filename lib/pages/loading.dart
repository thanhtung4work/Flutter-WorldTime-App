
import 'package:flutter/material.dart';
import 'package:international_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void initWorldTime() async {
    WorldTime instance = WorldTime("Ho Chi Minh city", "vn-flag.gif", "asia/ho_chi_minh");
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flagUrl,
      "time": instance.timeString,
      "date": instance.dateString,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  void initState(){
    super.initState();
    initWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.red,
            size: 70.0,
          )
      )
    );
  }
}
