import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/model/dprint.dart';
import 'package:fooddelivery/model/homescreenModel.dart';
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

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with SingleTickerProviderStateMixin {
  FaceBookLogin facebookLogin = FaceBookLogin();
  GoogleLogin googleLogin = GoogleLogin();
  AppleLogin appleLogin = AppleLogin();

  //////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //
  //
  _pressCreateAccountButton() {
    print("User pressed \"CREATE ACCOUNT\" button");
    print(
        "Login: ${editControllerName.text}, E-mail: ${editControllerEmail.text}, "
        "password1: ${editControllerPassword1.text}, password2: ${editControllerPassword2.text}");
    if (editControllerName.text.isEmpty)
      return openDialog(strings.get(175)); // "Enter your Login"
    if (editControllerEmail.text.isEmpty)
      return openDialog(strings.get(176)); // "Enter your E-mail"
    if (!validateEmail(editControllerEmail.text))
      return openDialog(strings.get(178)); // "You E-mail is incorrect"
    if (editControllerPassword1.text.isEmpty ||
        editControllerPassword2.text.isEmpty)
      return openDialog(strings.get(177)); // "Enter your password"
    if (editControllerPassword1.text != editControllerPassword2.text)
      return openDialog(strings.get(134)); // "Passwords are different.",
    if (appSettings.otp == "true")
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(
              name: editControllerName.text,
              email: editControllerEmail.text,
              type: "email",
              password: editControllerPassword1.text,
              photo: ""),
        ),
      );

    _waits(true);
    register(editControllerEmail.text, editControllerPassword1.text,
        editControllerName.text, "email", "", _okUserEnter, _error);
  }

  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  var windowWidth;
  var windowHeight;
  final editControllerName = TextEditingController();
  final editControllerEmail = TextEditingController();
  final editControllerPassword1 = TextEditingController();
  final editControllerPassword2 = TextEditingController();
  ScrollController _scrollController = ScrollController();

  _initiOS() {
    if (Platform.isIOS) {
      TheAppleSignIn.onCredentialRevoked.listen((_) {
        dprint("Credentials revoked");
      });
    }
  }

  final Future<bool> _isAvailableFuture = TheAppleSignIn.isAvailable();

  _buttoniOS() {
    if (Platform.isIOS) {
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
                        color: Color(0xff000000),
                        text: strings.get(299),
                        textStyle:
                            theme.text14boldWhite, // "Sign In with Apple",
                        icon: "assets/apple.png",
                        pressButton: () {
                          _waits(true);
                          appleLogin.login(_login, _error);
                        }))
                : null; // 'Sign in With Apple not available. Must be run on iOS 13+
          });
    } else {
      return Container();
    }
  }

  _okUserEnter(String name, String password, String avatar, String email,
      String token, String typeReg) {
    _waits(false);
    account.okUserEnter(name, password, avatar, email, token, "", 0, typeReg);
    route.pushToStart(context, "/main");
  }

  bool _wait = false;

  _waits(bool value) {
    _wait = value;
    if (mounted) setState(() {});
  }

  _error(String error) {
    _waits(false);
    if (error == "login_canceled") return;
    if (error == "3") return openDialog(strings.get(272)); // This email is busy
    openDialog("${strings.get(128)} $error"); // "Something went wrong. ",
  }

  @override
  void initState() {
    _initiOS();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    route.disposeLast();
    editControllerName.dispose();
    editControllerEmail.dispose();
    editControllerPassword1.dispose();
    editControllerPassword2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    Future.delayed(const Duration(milliseconds: 200), () {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    });
    return WillPopScope(
        onWillPop: () async {
          if (_show != 0) {
            setState(() {
              _show = 0;
            });
            return false;
          }
          return true;
        },
        child: Scaffold(
            backgroundColor: theme.colorBackground,
            body: Directionality(
              textDirection: strings.direction,
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    if (theme.appSkin == "basic")
                      IBackground4(
                          width: windowWidth,
                          colorsGradient: theme.colorsGradient),
                    if (theme.appSkin == "smarter")
                      Container(
                        width: windowWidth,
                        height: windowHeight,
                        color: theme.colorPrimary,
                      ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/bg_login.png'),
                              fit: BoxFit.cover)),
                      alignment: Alignment.bottomCenter,
                      // margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: windowWidth,
                      height: windowHeight,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: windowWidth,
                            height: 150,
                            child: Image.asset("assets/login_logo.png",
                                fit: BoxFit.fitWidth),
                          ),
                          Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.fromLTRB(32, 16, 32, 32),
                              height: windowHeight - 150,
                              child: _body())
                        ],
                      ),
                    ),
                    if (_wait) skinWait(context, true),
                    IEasyDialog2(
                      setPosition: (double value) {
                        _show = value;
                      },
                      getPosition: () {
                        return _show;
                      },
                      color: theme.colorGrey,
                      body: _dialogBody,
                      backgroundColor: theme.colorBackground,
                    ),
                    IAppBar(context: context, text: "", color: Colors.black),
                  ],
                ),
              ),
            )));
  }

  _body() {
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.only(left: 5, right: 5),
      width: windowWidth,
      height: windowHeight - 200,
      alignment: FractionalOffset.topCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ]),
        border: Border.all(color: Colors.black, width: 5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25)),
      ),
      child: ListView(
        shrinkWrap: true,
        controller: _scrollController,
        children: <Widget>[
          Container(
            width: windowWidth,
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            child: Text(
              strings.get(24), // "Create an Account!"
              style: theme.text20boldWhite, textAlign: TextAlign.start,
            ),
          ),

          SizedBox(
            height: 15,
          ),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   height: 0.5,
          //   color: Colors.black.withAlpha(200),               // line
          // ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: IInputField2a(
                hint: strings.get(15), // "Login"
                icon: Icons.account_circle,
                iconColor: Colors.black,
                colorDefaultText: Colors.black,
                controller: editControllerName,
                isBorderLined: true,
              )),
          SizedBox(
            height: 5,
          ),

          SizedBox(
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: IInputField2a(
                hint: strings.get(21), // "E-mail address",
                icon: Icons.alternate_email,
                type: TextInputType.emailAddress,
                iconColor: Colors.black,
                colorDefaultText: Colors.black,
                controller: editControllerEmail, isBorderLined: true,
              )),
          SizedBox(
            height: 5,
          ),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   height: 0.5,
          //   color: Colors.black.withAlpha(200),               // line
          // ),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: IInputField2PasswordA(
                hint: strings.get(16), // "Password"
                icon: Icons.vpn_key,
                iconColor: Colors.black,
                colorDefaultText: Colors.black,
                controller: editControllerPassword1, isBorderLined: true,
              )),

          SizedBox(
            height: 5,
          ),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   height: 0.5,
          //   color: Colors.black.withAlpha(200),               // line
          // ),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: IInputField2PasswordA(
                hint: strings.get(25), // "Confirm Password"
                icon: Icons.vpn_key,
                iconColor: Colors.black,
                colorDefaultText: Colors.black,
                controller: editControllerPassword2, isBorderLined: true,
              )),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   height: 0.5,
          //   color: Colors.black.withAlpha(200),               // line
          // ),
          SizedBox(height: 32),

          Container(
            alignment: Alignment.bottomRight,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                if (appSettings.googleLogin == "true")
                  InkWell(
                    onTap: () => googleLogin.login(
                        _login, _error), // handle your onTap here
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'),
                                fit: BoxFit.contain)),
                        height: 40,
                        width: 50),
                  ),

                SizedBox(
                  width: 10,
                ),
                if (appSettings.facebookLogin == "true")
                  InkWell(
                    onTap: () => facebookLogin.login(
                        _login, _error), // handle your onTap here
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/facebook.png'),
                                fit: BoxFit.contain)),
                        height: 40,
                        width: 50),
                  ),

                // SizedBox(width: 10,),
                Spacer(),
                InkWell(
                  onTap: () =>
                      _pressCreateAccountButton(), // handle your onTap here
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      height: 50,
                      width: 150,
                      child: IButton3(
                          radiusB: 12.0,
                          color: Colors.black,
                          text: strings.get(26),
                          textStyle: theme.text14boldWhite, // CREATE ACCOUNT
                          pressButton: () {
                            _pressCreateAccountButton();
                          })),
                ),
              ],
            ),
          ),
/*
      if (appSettings.googleLogin == "true" || appSettings.facebookLogin == "true")
          Container(child: Row(children: [
            Expanded(child: Container(height: 0.3, color: theme.colorBackground,)),
            Text(strings.get(271), style: theme.text14boldWhite),  // " or "
            Expanded(child: Container(height: 0.3, color: theme.colorBackground,)),
          ],)),

        if (appSettings.googleLogin == "true")
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: IButton4(
                  color: Color(0xffd9534f), text: strings.get(269), textStyle: theme.text14boldWhite,  // Sign In with Google
                  icon: "assets/google.png",
                  pressButton: (){
                    _waits(true);
                    googleLogin.login(_login, _error);
                  })),

        if (appSettings.facebookLogin == "true")
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: IButton4(
                  color: Color(0xff428bca), text: strings.get(270), textStyle: theme.text14boldWhite,  // Sign In with Facebook
                  icon: "assets/facebook.png",
                  pressButton: (){
                    _waits(true);
                    facebookLogin.login(_login, _error);
                  })),

          if (appSettings.googleLogin == "true" || appSettings.facebookLogin == "true")
            _buttoniOS(),
*/
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  _login(String type, String id, String name, String photo) {
    dprint("Reg: type=$type, id=$id, name=$name, photo=$photo");
    if (appSettings.otp == "true")
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(
              name: name,
              email: "$id@$type.com",
              type: type,
              password: id,
              photo: photo),
        ),
      );

    register("$id@$type.com", id, name, type, photo, _okUserEnter, _error);
  }

  double _show = 0;
  Widget _dialogBody = Container();

  openDialog(String _text) {
    _waits(false);
    _dialogBody = Column(
      children: [
        Text(
          _text,
          style: theme.text14,
        ),
        SizedBox(
          height: 40,
        ),
        IButton3(
            color: theme.colorPrimary,
            text: strings.get(155), // Cancel
            textStyle: theme.text14boldWhite,
            pressButton: () {
              setState(() {
                _show = 0;
              });
            }),
      ],
    );

    setState(() {
      _show = 1;
    });
  }
}
