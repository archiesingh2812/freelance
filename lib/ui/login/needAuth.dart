import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/widget/ibackground4.dart';
import 'package:fooddelivery/widget/ibutton3.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart';

_pressLoginButton(BuildContext context){
  print("User pressed \"LOGIN\" button");
  route.push(context, "/login");
}

_pressDontHaveAccountButton(BuildContext context){
  print("User press \"Don't have account\" button");
  route.push(context, "/createaccount");
}

mustAuthSmarter(double windowWidth, BuildContext context){
  return Container(
    child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage('assets/bg_login.png'),
                fit: BoxFit.cover
            )
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            UnconstrainedBox(
                child: Container(
                    width: windowWidth*0.4,
                    child: Image.asset("assets/authSmarter.png",
                      fit: BoxFit.contain, color: Colors.black.withAlpha(80),
                    )
                )
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: windowWidth*0.15, right: windowWidth*0.15),
              child: Text(strings.get(125), textAlign: TextAlign.center, style: theme.text18boldPrimary), // "You must sign-in to access to this section",
            ),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: windowWidth*0.2, right: windowWidth*0.2),
              child: IButton3(pressButton: (){_pressLoginButton(context);}, text: strings.get(22), // LOGIN
                color: theme.colorPrimary,
                textStyle: theme.text16boldWhite,),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              child: InkWell(
                  onTap: () {
                    _pressDontHaveAccountButton(context);
                  }, // needed
                  child:Text(strings.get(19),                    // ""Don't have an account? Create",",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: theme.text14primary
                  )),
            )
          ],
        )
    ),
  );
}

mustAuth(double windowWidth, BuildContext context){
  if (theme.appSkin == "smarter")
    return mustAuthSmarter(windowWidth, context);
  return Container(
    child: Center(/*
      height: windowWidth*2,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage('assets/bg_login.png'),
                fit: BoxFit.cover
            )
        ),*/
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 100,),
            UnconstrainedBox(
                child: Container(
                    width: windowWidth/3,
                    child: Image.asset("assets/auth.png",
                      fit: BoxFit.contain, color: Colors.black,
                    )
                )
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: windowWidth*0.15, right: windowWidth*0.15),
              child: Text(strings.get(125), textAlign: TextAlign.center, style: TextStyle(color: Colors.black),), // "You must sign-in to access to this section",
            ),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: windowWidth*0.1, right: windowWidth*0.1),
              child: IButton3(pressButton: (){_pressLoginButton(context);}, text: strings.get(22), // LOGIN
                color: Colors.black,
                textStyle: theme.text16boldWhite.copyWith(color: Colors.white.withOpacity(0.9)),),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              /*
              decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.white24,
                ],
              ),
              ),*/
              child: InkWell(
                  onTap: () {
                    _pressDontHaveAccountButton(context);
                  }, // needed
                  child:Text(strings.get(19),                    // ""Don't have an account? Create",",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: theme.text14primary.copyWith(color: Colors.black)
                  )),
            )
          ],
        )
    ),
  );
}