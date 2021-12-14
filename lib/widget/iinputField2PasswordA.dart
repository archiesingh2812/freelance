import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';

class IInputField2PasswordA extends StatefulWidget {
  final String hint;
  final IconData icon;
  final Function(String) onChangeText;
  final TextEditingController controller;
  final TextInputType type;
  final Color colorDefaultText;
  final Color iconColor;
  final isBorderLined;
  IInputField2PasswordA({this.hint, this.icon, this.isBorderLined = false, this.controller, this.iconColor, this.type, this.colorDefaultText,
    this.onChangeText});

  @override
  _IInputField2PasswordAState createState() => _IInputField2PasswordAState();
}

class _IInputField2PasswordAState extends State<IInputField2PasswordA> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    Color _colorDefaultText = Colors.black;
    if (widget.colorDefaultText != null)
      _colorDefaultText = widget.colorDefaultText;
    var _sicon = Icon(widget.icon,color:widget.iconColor != null ? widget.iconColor : theme.AATBlueColor,);

    var _icon = Icons.visibility_off;
    if (!_obscureText)
      _icon = Icons.visibility;

    var _sicon2 = IconButton(
      iconSize: 20,
      icon: Icon(
        _icon, //_icon,
        color: _colorDefaultText,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );

    return Container(
      child: new TextFormField(
        obscureText: _obscureText,
        cursorColor: _colorDefaultText,
        keyboardType: widget.type,
        controller: widget.controller,
        onChanged: (String value) async {
          if (widget.onChangeText != null)
            widget.onChangeText(value);
        },
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: _colorDefaultText,
        ),
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