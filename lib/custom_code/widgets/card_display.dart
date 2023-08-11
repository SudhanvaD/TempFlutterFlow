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

import 'package:u_credit_card/u_credit_card.dart'; // Import the package

class CardDisplay extends StatefulWidget {
  const CardDisplay({
    Key? key,
    this.width,
    this.height,
    this.image,
    this.name,
    this.first6,
    this.last4,
    this.month,
    this.year,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? image;
  final String? name;
  final String? first6;
  final String? last4;
  final String? month;
  final String? year;

  @override
  _CardDisplayState createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: CreditCardUi(
          cardHolderFullName: widget.name ?? '',
          cardNumber: ((widget.first6?.substring(0, 4) ?? '') +
              '00000000' +
              (widget.last4 ?? '')),
          validThru: ((widget.month ?? '') +
              '/' +
              ((widget.year ?? '').substring((widget.year ?? '').length - 2))),
          topLeftColor: Colors.blue,
          bottomRightColor: Colors.black,
          doesSupportNfc: true,
          placeNfcIconAtTheEnd: true,
          cardProviderLogoPosition: CardProviderLogoPosition.right,

          // cardHolderFullName: 'John Doe',
          // cardNumber: '1234567812345678',
          // validFrom: '01/23',
          // validThru: '01/28',
          // topLeftColor: Colors.blue,
          // doesSupportNfc: true,
          // placeNfcIconAtTheEnd: true,
        ),
      ),
    );
  }
}
