import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/model/dprint.dart';
import 'package:fooddelivery/model/homescreenModel.dart';
import 'package:fooddelivery/model/server/login.dart';
import 'package:fooddelivery/model/server/register.dart';
import 'package:fooddelivery/model/social/apple.dart';
import 'package:fooddelivery/model/social/facebook.dart';
import 'package:fooddelivery/model/social/google.dart';
import 'package:fooddelivery/model/utils.dart';
import 'package:fooddelivery/widget/easyDialog2.dart';
import 'package:fooddelivery/widget/iappBar.dart';
import 'package:fooddelivery/widget/ibackground4.dart';
import 'package:fooddelivery/widget/ibutton3.dart';
import 'package:fooddelivery/widget/ibutton4.dart';
import 'package:fooddelivery/widget/iinputField2PasswordA.dart';
import 'package:fooddelivery/widget/iinputField2a.dart';
import 'package:fooddelivery/widget/skinRoute.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  FaceBookLogin facebookLogin = FaceBookLogin();
  GoogleLogin googleLogin = GoogleLogin();
  AppleLogin appleLogin = AppleLogin();

  //////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //
  //

  _pressLoginButton(){
    print("User pressed \"LOGIN\" button");
    print("Login: ${editControllerName.text}, password: ${editControllerPassword.text}");
    if (editControllerName.text.isEmpty)
      return openDialog(strings.get(172)); // "Enter Login",
    if (!validateEmail(editControllerName.text))
      return openDialog(strings.get(174)); // "Login or Password in incorrect"
    if (editControllerPassword.text.isEmpty)
      return openDialog(strings.get(173)); // "Enter Password",
    _waits(true);
    _socialEnter = false;
    login(editControllerName.text, editControllerPassword.text, _okUserEnter, _error);
  }

  var _socialEnter = false;
  var _socialId = "";
  var _socialType = "";
  var _socialName = "";
  var _socialPhoto = "";

  _login(String type, String id, String name, String photo) {
    _socialEnter = true;
    _socialId = id;
    _socialType = type;
    _socialName = name;
    _socialPhoto = photo;
    login("$id@$type.com", id, _okUserEnter, _error);
  }

  _pressDontHaveAccountButton(){
    print("User press \"Don't have account\" button");
    route.push(context, "/createaccount");
  }

  _pressForgotPasswordButton(){
    print("User press \"Forgot password\" button");
    route.push(context, "/forgot");
  }
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  var windowWidth;
  var windowHeight;
  final editControllerName = TextEditingController();
  final editControllerPassword = TextEditingController();
  bool _wait = false;
  ScrollController _scrollController = ScrollController();

  _waits(bool value){
    _wait = value;
    if (mounted)
      setState(() {
      });
  }

  _error(String error){
    _waits(false);
    if (error == "login_canceled")
      return;
    if (error == "1") {
      if (_socialEnter){
        if (appSettings.otp == "true")
          return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(
                  name: _socialName,
                  email: "$_socialId@$_socialType.com",
                  type: _socialType,
                  password: _socialId,
                  photo: _socialPhoto
              ),
            ),
          );
        return register("$_socialId@$_socialType.com", _socialId, _socialName, _socialType, _socialPhoto, _okUserEnter2, _error);
      }
      return openDialog(strings.get(174)); // "Login or Password in incorrect"
    }
    openDialog("${strings.get(128)} $error"); // "Something went wrong. ",
  }

  _okUserEnter2(String name, String password, String avatar, String email, String token, String typeReg){
    _waits(false);
    account.okUserEnter(name, password, avatar, email, token, "", 0, typeReg);
    route.pushToStart(context, "/main");
  }

  _okUserEnter(String name, String password, String avatar, String email, String token, String _phone, int i, String typeReg){
    _waits(false);
    account.okUserEnter(name, password, avatar, email, token, _phone, i, typeReg);
    route.pop(context);
  }

  @override
  void initState() {
    _initiOS();
    super.initState();
  }

  _initiOS(){
    if(Platform.isIOS) {
      TheAppleSignIn.onCredentialRevoked.listen((_) {
        dprint("Credentials revoked");
      });
    }
  }

  _buttoniOS(){
    if(Platform.isIOS) {
      return FutureBuilder<bool>(
          future: _isAvailableFuture,
          builder: (context, isAvailableSnapshot) {
            if (!isAvailableSnapshot.hasData) {
              return Container();
            }
            return isAvailableSnapshot.data
                ? Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: IButton4(
                    color: Color(0xff000000), text: strings.get(298), textStyle: theme.text14boldWhite,  // "Log In with Apple",
                    icon: "assets/apple.png",
                    pressButton: (){
                      _waits(true);
                      appleLogin.login(_login, _error);
                    }))
                : Container(); // 'Sign in With Apple not available. Must be run on iOS 13+
          });
    }else{
      return Container();
    }
  }

  final Future<bool> _isAvailableFuture = TheAppleSignIn.isAvailable();

  @override
  void dispose() {
    editControllerName.dispose();
    editControllerPassword.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    Future.delayed(const Duration(milliseconds: 200), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent,);
    });
    return Scaffold(
      //backgroundColor: theme.colorBackground,

      body: Directionality(
        textDirection: strings.direction,
        child: Stack(
        children: <Widget>[

          if (theme.appSkin == "basic")
            IBackground4(width: windowWidth, colorsGradient: theme.colorsGradient),
           if (theme.appSkin == "smarter")
             Container(
                 width: windowWidth,
                 height: windowHeight,
                 color: theme.colorPrimary,
             ),

            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: windowWidth,
              child: _body(),
           ),

          if (_wait)
            skinWait(context, true),

          IEasyDialog2(setPosition: (double value){_show = value;}, getPosition: () {return _show;}, color: theme.colorGrey,
            body: _dialogBody, backgroundColor: theme.colorBackground,),

          IAppBar(context: context, text: "", color: Colors.white),

        ],
      ),
    ));
  }

  double _show = 0;
  Widget _dialogBody = Container();

  openDialog(String _text) {
    _waits(false);
    _dialogBody = Column(
      children: [
        Text(_text, style: theme.text14,),
        SizedBox(height: 40,),
        IButton3(
            color: theme.colorPrimary,
            text: strings.get(155),              // Cancel
            textStyle: theme.text14boldWhite,
            pressButton: (){
              setState(() {
                _show = 0;
              });
            }
        ),
      ],
    );

    setState(() {
      _show = 1;
    });
  }

  _body(){
    return ListView(

        children: <Widget>[

    Container(
    margin: EdgeInsets.only(top: 50),
    width: windowWidth,
    height: 150,
    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
    ),

    SizedBox(height: 10,),
    Container(
    margin: EdgeInsets.only(top: 0),
    width: windowWidth,
    height: 70,
    child: Image.asset("assets/logo_sec.png", fit: BoxFit.contain),
    ),
    SizedBox(height: 40,),
/*
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Text(strings.get(13),                        // "Let's start with LogIn!"
              style: theme.text20boldWhite
          ),
        ),
        */

    Container(
    margin: EdgeInsets.only(top: 0),
    padding: EdgeInsets.only(left:5, right: 5),
    width: windowWidth,
    height: 250,
    alignment: FractionalOffset.bottomCenter,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors:[
    Colors.white,
    Colors.white,
    ]
    ),
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
    bottomLeft: Radius.circular(25)
    ),
    ),
    child: Center(

    child:
    ListView(


    children: <Widget>[
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: IInputField2a(
              hint: strings.get(15),            // "Login"
                colorDefaultText: Colors.black,
              icon: Icons.person,
              //colorDefaultText: Colors.white,
              controller: editControllerName,
              type: TextInputType.emailAddress
            )
        ),
        SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 0.5,
          //color: Colors.white.withAlpha(200),               // line
        ),
        SizedBox(height: 5,),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: IInputField2PasswordA(
              hint: strings.get(16),            // "Password"
              icon: Icons.lock,
              //colorDefaultText: Colors.black54,
              controller: editControllerPassword,
            )),

      Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.fromLTRB(250, 0, 0, 0),
          child: Row(
            children: [

            ],
          )
      ),
        SizedBox(height: 20,),

      Container(
        margin: EdgeInsets.only(left:30, right: 30),
          width: windowWidth-100,
          child: Row(
            children: [
              if (appSettings.googleLogin == "true")
              InkWell(
                onTap: () =>googleLogin.login(_login, _error), // handle your onTap here
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage('assets/google.png'),
                            fit: BoxFit.contain
                        )
                    ),
                    height: 60, width: windowWidth*0.14),
              ),

              SizedBox(width: 7,),
              if (appSettings.facebookLogin == "true")
              InkWell(
                onTap: () =>facebookLogin.login(_login, _error), // handle your onTap here
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage('assets/facebook.png'),
                            fit: BoxFit.contain
                        )
                    ),
                    height: 60, width: windowWidth*0.14),
              ),

              SizedBox(width: 7,),
              InkWell(
                onTap: () =>_pressLoginButton(), // handle your onTap here
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage('assets/btn_entrar.png'),
                            fit: BoxFit.contain
                        )
                    ),
                    height: 45, width: windowWidth*0.32),
              ),
            ],
          )
      ),


        SizedBox(height: 30,),


    ]
    )
    )

    ),

          SizedBox(height: 30,),
          InkWell(
              onTap: () {
                _pressDontHaveAccountButton();
              }, // needed
              child:Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
                child: Text(strings.get(19),                    // ""Don't have an account? Create",",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: theme.text14boldWhite
                ),
              )),
          InkWell(
              onTap: () {
                _pressForgotPasswordButton();
              }, // needed
              child:Container(
                padding: EdgeInsets.all(20),
                child: Text(strings.get(17),                    // "Forgot password",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: theme.text14boldWhite
                ),
              ))
        ],
    );
  }
}