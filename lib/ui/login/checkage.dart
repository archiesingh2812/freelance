import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';

class CheckAge extends StatefulWidget {
  String email;
  String password;
  Function login;
  CheckAge({Key key, this.email, this.password, this.login}) : super(key: key);

  @override
  _CheckAgeState createState() => _CheckAgeState();
}

class _CheckAgeState extends State<CheckAge> {
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
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Text(
                    strings.get(320), // """are you above 18","
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 36))),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                        route.pushToStart(context, "/main");

                  },
                  // handle your onTap here
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.black,
                      ),
                      height: 45,
                      child: Text(
                        'SIM',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.AATBlueColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      width: width * 0.32),
                ),
                InkWell(
                  onTap: () {
                    print("User is not 18+");
                    account.logOut();
                        // route.push(context, "/createaccount");
                    route.push(context, "/lessAge");
                  },
                  // handle your onTap here
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.black,
                      ),
                      height: 45,
                      child: Text(
                        'NÃO',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.AATBlueColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      width: width * 0.32),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
