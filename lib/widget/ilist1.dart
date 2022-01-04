import 'package:flutter/material.dart';

import '../main.dart';

//
// v3 14.03.2021
// v2 05.10.2020
//

class ListWithIcon extends StatelessWidget {
  final String imageAsset;
  final String text;
  final IconData icon;
  final Color imageColor;
  ListWithIcon({this.imageAsset, this.text = "", this.imageColor, this.icon});

  @override
  Widget build(BuildContext context) {
    Widget _imageAsset = Container();

    if (theme.appSkin == "smarter") {
      if (icon != null)
        _imageAsset = Icon(
          icon,
          color: (imageColor != null) ? imageColor : null,
        );
    } else if (imageAsset != null) {
      _imageAsset = Image.asset(
        imageAsset,
        fit: text == strings.get(268) ? BoxFit.fitHeight : BoxFit.contain,
        color: (imageColor != null) ? imageColor : null,
      );
      _imageAsset = UnconstrainedBox(
          child: text == strings.get(268)
              ? Container(height: 35, width: 35, child: _imageAsset)
              : Container(height: 25, width: 25, child: _imageAsset));
    }

    return Row(
      children: <Widget>[
        _imageAsset,
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          text,
          style: theme.text16bold,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        )),
      ],
    );
  }
}
