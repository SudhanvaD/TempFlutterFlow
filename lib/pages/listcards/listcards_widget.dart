import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listcards_model.dart';
export 'listcards_model.dart';

class ListcardsWidget extends StatefulWidget {
  const ListcardsWidget({Key? key}) : super(key: key);

  @override
  _ListcardsWidgetState createState() => _ListcardsWidgetState();
}

class _ListcardsWidgetState extends State<ListcardsWidget> {
  late ListcardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListcardsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.token = await actions.createToken();
      setState(() {
        FFAppState().LocalState = _model.token!;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: ListCardsNuveiCall.call(
        authToken: FFAppState().LocalState,
        uid: FFAppState().UserID,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final listcardsListCardsNuveiResponse = snapshot.data!;
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
                            context.safePop();
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: Color(0xFF5B0DAC),
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
                          context.safePop();
                        },
                        child: Text(
                          'Atrás',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF5B0DAC),
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
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: FaIcon(
                              FontAwesomeIcons.creditCard,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              'Gestionar Tarjetas',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 10.0, 0.0, 10.0),
                          child: Text(
                            'Agrega o elimina tarjetas de crédito y débito',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 506.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final cards = (ListCardsNuveiCall.last4digits(
                                      listcardsListCardsNuveiResponse.jsonBody,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount: cards.length,
                                  itemBuilder: (context, cardsIndex) {
                                    final cardsItem = cards[cardsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 14.0, 10.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 64.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Image.network(
                                                      () {
                                                        if (ListCardsNuveiCall
                                                                .cardType(
                                                              listcardsListCardsNuveiResponse
                                                                  .jsonBody,
                                                            )[cardsIndex] ==
                                                            FFAppState()
                                                                .cardType) {
                                                          return 'https://mluoriccfnii.i.optimole.com/l8o1-iM-Futl9YOI/w:1108/h:651/q:auto/https://metalcreditkard.com/wp-content/uploads/2020/02/MCK-BLACK-METAL-CUREDIT-CARD-1.png';
                                                        } else if (ListCardsNuveiCall
                                                                .cardType(
                                                              listcardsListCardsNuveiResponse
                                                                  .jsonBody,
                                                            )[cardsIndex] ==
                                                            FFAppState()
                                                                .discover) {
                                                          return 'https://thefinancetrend.com/wp-content/uploads/2022/11/image-26.png';
                                                        } else if (ListCardsNuveiCall
                                                                .cardType(
                                                              listcardsListCardsNuveiResponse
                                                                  .jsonBody,
                                                            )[cardsIndex] ==
                                                            FFAppState()
                                                                .diners) {
                                                          return 'https://clipground.com/images/diners-clipart-2.jpg';
                                                        } else {
                                                          return 'https://th.bing.com/th/id/R.3fd2ea288d19b2fb7211626ef7805753?rik=LNxutxeXWwylAQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f2%2fBlue-Credit-Card.png&ehk=g%2fTMPhDjqBNu2PhXeOEThpdFpNl8qt2%2fUJ8L0tZP5yo%3d&risl=&pid=ImgRaw&r=0';
                                                        }
                                                      }(),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (listcardsListCardsNuveiResponse
                                                            .succeeded)
                                                          Text(
                                                            'Tarjeta de alimentación',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .newCustomFunction(
                                                                    valueOrDefault<
                                                                        String>(
                                                              (ListCardsNuveiCall
                                                                      .last4digits(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[cardsIndex],
                                                              'XXXX',
                                                            )),
                                                            'XXXX',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'DEBITO BANCO PICHINCHA',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                14.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'delete',
                                                          queryParameters: {
                                                            'token':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .tokens(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[cardsIndex],
                                                              ParamType.String,
                                                            ),
                                                            'cardname':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .name(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[
                                                                      cardsIndex]
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                            'last4':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .last4digits(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[cardsIndex],
                                                              ParamType.String,
                                                            ),
                                                            'first5':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .first6digits(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[
                                                                      cardsIndex]
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                            'expiryMonth':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .month(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[
                                                                      cardsIndex]
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                            'expiryYear':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .year(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[
                                                                      cardsIndex]
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                            'type':
                                                                serializeParam(
                                                              (ListCardsNuveiCall
                                                                      .cardType(
                                                                listcardsListCardsNuveiResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[
                                                                      cardsIndex]
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 125.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('AddCard');
                          },
                          text: 'Add Card',
                          options: FFButtonOptions(
                            width: 272.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF7C2AE8),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
