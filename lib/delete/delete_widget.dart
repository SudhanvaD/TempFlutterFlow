import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_model.dart';
export 'delete_model.dart';

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({
    Key? key,
    required this.token,
    required this.cardname,
    required this.last4,
    required this.first5,
    required this.expiryMonth,
    required this.expiryYear,
    required this.type,
  }) : super(key: key);

  final String? token;
  final String? cardname;
  final String? last4;
  final String? first5;
  final String? expiryMonth;
  final String? expiryYear;
  final String? type;

  @override
  _DeleteWidgetState createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  late DeleteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('listcards');
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Color(0xFF7C2AE8),
                        size: 24.0,
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('listcards');
                    },
                    child: Text(
                      'Atrás',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF7C2AE8),
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            26.0, 10.0, 0.0, 10.0),
                        child: Text(
                          'Tarjeta de alimentación',
                          textAlign: TextAlign.justify,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 342.0,
                    height: 286.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          widget.type == 'vi'
                              ? 'http://gseii.org/site/wp-content/uploads/2014/05/blue-gradient-wallpaper.jpg'
                              : 'https://c4.wallpaperflare.com/wallpaper/988/889/137/simple-gradient-minimalism-wallpaper-preview.jpg',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(27.0, 0.0, 27.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 33.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    widget.type == 'mc'
                                        ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/card-u-i-9c4s01/assets/tuqiatmzk5sz/master_1.svg'
                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/card-u-i-9c4s01/assets/lyxsszue47vz/visa.png',
                                    width: 45.0,
                                    height: 27.0,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: Text(
                              ' **** **** **** ${widget.last4}',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      'Card holder name',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    widget.cardname!,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'Expiry Date',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.expiryMonth}/${functions.newCustomFunction2(widget.expiryYear)}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 5.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.headertoken = await actions.createToken();
                        _model.apiResultswagger =
                            await DeleteSwaggerAPICall.call(
                          cardnumber: widget.token,
                        );
                        _model.nuvei = await DeleteNuveiCall.call(
                          tokensInApi: widget.token,
                          authToken: _model.headertoken,
                          userId: FFAppState().UserID,
                        );
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text((_model.nuvei?.bodyText ?? '')),
                              content: Text(
                                  (_model.apiResultswagger?.bodyText ?? '')),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        setState(() {});
                      },
                      text: 'Eliminar Tarjeta',
                      icon: Icon(
                        Icons.delete,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 272.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 125.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Guardar Cambios',
                        options: FFButtonOptions(
                          width: 272.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF7C2AE8),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
