import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/widget/ibackground4.dart';
import 'package:percent_indicator/percent_indicator.dart';

double percent = 0.0;

double _height;
double _width;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ////////////////////////////////////////////////////////////////
  //
  //
  //
  _startNextScreen(){
    route.setDuration(1);
    //route.pushToStart(context, "/login");
    route.pushToStart(context, "/main");
  }
  //
  //
  ////////////////////////////////////////////////////////////////
  var windowWidth;
  var windowHeight;

  @override
  void initState() {
    pref.init();
    Timer timer;
    if(mounted) {
      super.initState();
    }
    timer = Timer.periodic(Duration(milliseconds:500),(_){
      setState(() {
        percent+=10;
        if(percent >= 100){
          timer.cancel();
          startTime();
          // percent=0;
        }
      });
    });


  }

  startTime() async {
    var duration = new Duration(seconds: 0);
    return Timer(duration, _startNextScreen);
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[

            Container(
              width: windowHeight,
                height: windowHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage('assets/bg_carregando.png'),
                        fit: BoxFit.cover
                    )
                ),
              child:            Container(
                height: 50,
                child:            Container(
                  margin: EdgeInsets.only(top:130),
                height: 20, width: 100,
                child:
                new CircularPercentIndicator(
                  radius: 70.0,
                  animation: true,
                  animationDuration: 100,
                  percent:percent/100,
                  center: new Text(percent.toString() + "%"),
                  progressColor: theme.AATBlueColor,
                )
                /*CircularProgressIndicator(
                        strokeWidth: 5,
                        backgroundColor: theme.colorCompanion,
                        valueColor: AlwaysStoppedAnimation<Color>(const Color(0XFF3412FA)),
                      ),
                  */
              ),

              ),

                //color: theme.colorBackground,
               // child: Image.asset('assets/logo.png', fit: BoxFit.cover,)
            ),



          ],
        )

    );
  }

}


