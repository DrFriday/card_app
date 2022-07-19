import 'package:cardapp/src/core/res/colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.childWidget,
  }) : super(key: key);

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Container(
          width: 350,
          height: 250,
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: AppColor.primary,
            elevation: 10,
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
