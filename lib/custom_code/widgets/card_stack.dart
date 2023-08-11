// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CardStack extends StatefulWidget {
  const CardStack({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  // Make sure the state class is properly defined
  List<Widget> cards = [];

  @override
  void initState() {
    super.initState();
    cards = [
      Card(color: Colors.red, child: Container(width: 350, height: 300)),
      Card(color: Colors.green, child: Container(width: 350, height: 300)),
      Card(color: Colors.blue, child: Container(width: 350, height: 300)),
    ];
  }

  void _moveToFront(int index) {
    setState(() {
      // Ensure setState is inside a method within the state class
      final card = cards.removeAt(index);
      cards.add(card);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // Make sure 'widget' is used within the state class
      height: widget.height,
      child: Stack(
        children: cards.map((card) {
          final index = cards.indexOf(card);
          return Positioned(
            top: 20.0 * index,
            left: 0,
            child: GestureDetector(
              onTap: () => _moveToFront(index),
              child: card,
            ),
          );
        }).toList(),
      ),
    );
  }
}
