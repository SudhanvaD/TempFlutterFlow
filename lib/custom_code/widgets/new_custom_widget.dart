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

import 'package:paymentez/paymentez.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialogPaymentez(
              context: context,
              isDebug: false,
              uid: 'ec774d32-8c3d-4df5-af5e-77e5177f4d1d',
              email: 'user@softnux.io',
              environment: 'stg',
              paymentClientAppCode: 'TPP3-EC-CLIENT',
              paymentClientAppKey: '*********************',
              background: 'F3F3F5',
              btnBackground1: 'f02b6c',
              btnBackground2: 'f02b6c',
              textAddCard: 'Add card',
              textProcessingCard: 'Processing card',
              funReturnData: (DataModel data, controller) {
                switch (data.status) {
                  case 'success':
                    print('success card with paymentez');
                    controller?.goBack();
                    Navigator.of(context).pop();
                    break;

                  case 'review':
                    print('review card with paymentez');
                    controller?.goBack();
                    Navigator.of(context).pop();
                    break;

                  case 'failure':
                    print('failure card with paymentez');
                    controller?.goBack();
                    Navigator.of(context).pop();
                    break;

                  case 'error':
                    print(data.error?.type);
                    // todo se puede agregar una notificación que hay un error al querer agregar la tarjeta.
                    break;
                }
              },
            );
          },
          child: Text('Agregar tarjeta'),
        ),
      ),
    );
  }
}
