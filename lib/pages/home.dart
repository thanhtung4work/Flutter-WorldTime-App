import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    if(data.isEmpty) {
      data = ModalRoute
          .of(context)!
          .settings
          .arguments as Map;
    }

    // set background
    String bgImagePath = data['isDaytime'] ? "good-morning.jpg" : "good-night.jpg";
    Color? color = data['isDaytime'] ? Colors.blue[200] : Colors.blue[900];
    Color locationTextColor;
    if (data['isDaytime']) {
      locationTextColor = Colors.indigo;
    } else {
      locationTextColor = Colors.cyan;
    }

    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$bgImagePath"),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, "/locations");
                        setState((){
                          if (result != null) {
                            data = result;
                          }
                    });
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text("Choose Location", style: TextStyle(fontSize: 20),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                      ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/flags/" + data['flag']),
                      ),
                      const SizedBox(width: 10,),
                      Text(data["location"], style: TextStyle(fontWeight: FontWeight.bold, color: locationTextColor),),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                      data["date"],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      )
                  ),
                  const SizedBox(height: 20),
                  Text(
                      data["time"],
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                          color: Colors.red[400]
                      )
                  )
                ],
              ),
            ),
          )
      )
    );
  }
}
