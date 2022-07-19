import 'package:cardapp/src/ui/widgets/card.dart';
import 'package:flutter/material.dart';

class FrontView extends StatelessWidget {
  const FrontView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    print("uu");
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
