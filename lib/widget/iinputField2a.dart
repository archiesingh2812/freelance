import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/main.dart';

class IInputField2a extends StatefulWidget {
  final String hint;
  final IconData icon;
  final IconData iconRight;
  final Function onPressRightIcon;
  final Function(String) onChangeText;
  final TextEditingController controller;
  final TextInputType type;
  final Color iconColor;
  final Color colorDefaultText;
  final isBorderLined;

  IInputField2a({this.hint, this.icon,this.isBorderLined = false, this.controller, this.type, this.colorDefaultText,
    this.iconRight, this.onPressRightIcon, this.onChangeText, this.iconColor});

  @override
  _IInputField2aState createState() => _IInputField2aState();
}

class _IInputField2aState extends State<IInputField2a> {

  @override
  Widget build(BuildContext context) {

    Color _colorDefaultText = Colors.black;
    if (widget.colorDefaultText != null)
      _colorDefaultText = widget.colorDefaultText;
    var _sicon = Icon(widget.icon, color:widget.iconColor != null ? widget.iconColor : theme.AATBlueColor,);

    var _sicon2;
    if (widget.iconRight != null)
      _sicon2 = InkWell(
      onTap: () {
        if (widget.onPressRightIcon != null)
          widget.onPressRightIcon();
      }, // needed
      child: Icon(widget.iconRight, color:widget.iconColor != null ? widget.iconColor : theme.AATBlueColor,));

    return Container(
      child: new TextFormField(
        keyboardType: widget.type,
        cursorColor: _colorDefaultText,
        controller: widget.controller,
        onChanged: (String value) async {
          if (widget.onChangeText != null)
            widget.onChangeText(value);
        },
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: _colorDefaultText,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp("[\"]")),
        ],
        decoration: new InputDecoration(
          prefixIcon: _sicon,
          suffixIcon: _sicon2,
          prefixIconColor: widget.iconColor,
          suffixIconColor: widget.iconColor,
          iconColor: widget.iconColor,
          border: widget.isBorderLined ? UnderlineInputBorder(borderSide: BorderSide(color: Colors.black ), borderRadius: BorderRadius.all(Radius.circular(16))) : InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: _colorDefaultText, fontWeight: FontWeight.w600,
              fontSize: 16.0),
        ),
      ),
    );
  }
}