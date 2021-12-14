import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';

class LessAge extends StatefulWidget {
  const LessAge({Key key}) : super(key: key);

  @override
  _LessAgeState createState() => _LessAgeState();
}

class _LessAgeState extends State<LessAge> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print('strings print${strings.get(320)}');
    return Scaffold(
      backgroundColor: theme.AATBlueColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg_login.png'), fit: BoxFit.cover)),
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: EdgeInsets.fromLTRB(24, 64, 24, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Image.asset(
              'assets/lessAge.png',
              width: width / 2,
            ),
            // Spacer(),
            SizedBox(
              height: 100,
            ),
            Flexible(
                child: Text(
                    strings.get(321), // "prohinited to sell for above 18",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 36))),
          ],
        ),
      ),
    );
  }
}
