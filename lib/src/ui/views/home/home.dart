import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/services/card_service.dart';
import 'widgets/front_view.dart';
import 'widgets/rear_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  //get datas
  void getData() async {
    await CardService.getCards().then((value) => print(value));
    //print all cards in console
  }

  bool isFront = true;
  void _switchCard() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Card App',
          style: TextStyle(color: Theme.of(context).primaryColor),
        )),
        body: _buildFlipAnimation());
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(isFront) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationX(value)..setEntry(0, 3, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildFlipAnimation() {
    // print('object');
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        // layoutBuilder: (widget, list) => Stack(children: [widget,...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: isFront
            ? const FrontView(
                title: "Que",
              )
            : const RearView(
                title: "ans",
              ),
      ),
    );
  }
}


//  child: ListView.builder(itemBuilder: (context, index) {
//           const cardItem = data[index];
//           return MyCard(
//             key: Key('my_card'),
//             title: cardItem.title,
//             subtitle: cardItem.subtitle,
//           );
//         }),
