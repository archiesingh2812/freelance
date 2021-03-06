import 'package:flutter/material.dart';

import '../main.dart';

class IBackground4 extends StatelessWidget {
  final double width;
  final List<Color> colorsGradient;
  final String heroTag;
  final double borderRadius;
  final Widget child;
  IBackground4({this.width, this.colorsGradient, this.heroTag, this.borderRadius, this.child});

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

  }
  @override
  Widget build(BuildContext context) {
    Widget _child = Container();
    if (child != null)
      _child = child;
    var _borderRadius = 0.0;
    if (borderRadius != null)
      _borderRadius = borderRadius;
    String _heroTag = UniqueKey().toString();
    if (heroTag != null)
      _heroTag = heroTag;

    var _width = 300.0;
    if (width != null)
      _width = width;

    var _colorsGradient = theme.colorsGradient;//[Color.fromARGB(255, 33, 206, 186), Color.fromARGB(255, 172, 229, 184), Color.fromARGB(255, 172, 229, 184)];
    if (colorsGradient != null)
      _colorsGradient = colorsGradient;

    return Hero(
        tag: _heroTag,
        child: Align(
          //alignment: Alignment.bottomCenter,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage('assets/bg_login.png'),
                      fit: BoxFit.cover
                  )
              ),

              child: Stack(
                children: <Widget>[
                  /*                 Container(
                    margin: EdgeInsets.only(top: 50, left: 10, bottom: 10),
                    height: 80,
                    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                  ),

                  Positioned(       // right bottom circle
                      width: _width*0.8,
                      height: _width*0.8,
                      bottom: -_width*0.4,
                      right: -_width*0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x20FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),

                  Positioned(       // left bottom circle
                      width: _width*0.3,
                      height: _width*0.3,
                      bottom: _width*0.5,
                      left: -_width*0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x0AFFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),

                  Positioned(       // left bottom circle
                      width: _width*0.2,
                      height: _width*0.2,
                      bottom: _width*0.2,
                      left: _width*0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x10FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),

                  Positioned(
                      width: _width*0.8,
                      height: _width*0.8,
                      top: -_width*0.4,
                      left: -_width*0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x20FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),

                  Positioned(
                      top: 70,
                      left: 10,
                      child: UnconstrainedBox(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/star.png",
                                fit: BoxFit.contain, color: Colors.white.withAlpha(80),
                              )
                          ))),

                  Positioned(
                      bottom: 20,
                      left: _width*0.2,
                      child: UnconstrainedBox(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/star.png",
                                fit: BoxFit.contain, color: Colors.white.withAlpha(80),
                              )
                          ))),

                  Positioned(
                      bottom: 10,
                      left: _width*0.7,
                      child: UnconstrainedBox(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/star.png",
                                fit: BoxFit.contain, color: Colors.white.withAlpha(80),
                              )
                          ))),

                  Positioned(
                      top: 20,
                      left: _width*0.5,
                      child: UnconstrainedBox(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/star.png",
                                fit: BoxFit.contain, color: Colors.white.withAlpha(80),
                              )
                          ))),
*/

                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: _child,
                      )
                  ),
                ],
              )
          ),
        )
    );
  }
}
