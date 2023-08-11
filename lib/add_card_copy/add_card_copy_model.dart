import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCardCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for CardNumber widget.
  TextEditingController? cardNumberController;
  String? Function(BuildContext, String?)? cardNumberControllerValidator;
  // State field(s) for ExpiryDate widget.
  String? expiryDateValue;
  FormFieldController<String>? expiryDateValueController;
  // State field(s) for CvvCode widget.
  TextEditingController? cvvCodeController;
  late bool cvvCodeVisibility;
  String? Function(BuildContext, String?)? cvvCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cvvCodeVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    yourNameController?.dispose();
    cardNumberController?.dispose();
    cvvCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
