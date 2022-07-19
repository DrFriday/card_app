import 'package:flutter/material.dart';

import '../../../widgets/card.dart';

class RearView extends StatelessWidget {
  const RearView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        childWidget: Center(
            child: GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Center(
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30.0))),
          ),
        ],
      ),
    )));
  }
}
