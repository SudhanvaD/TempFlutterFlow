import '/backend/api_requests/api_calls.dart';
import '/components/services_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listcards_copy2_copy_model.dart';
export 'listcards_copy2_copy_model.dart';

class ListcardsCopy2CopyWidget extends StatefulWidget {
  const ListcardsCopy2CopyWidget({Key? key}) : super(key: key);

  @override
  _ListcardsCopy2CopyWidgetState createState() =>
      _ListcardsCopy2CopyWidgetState();
}

class _ListcardsCopy2CopyWidgetState extends State<ListcardsCopy2CopyWidget> {
  late ListcardsCopy2CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListcardsCopy2CopyModel());

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
        final listcardsCopy2CopyListCardsNuveiResponse = snapshot.data!;
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 275.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final cards = (ListCardsNuveiCall.last4digits(
                                    listcardsCopy2CopyListCardsNuveiResponse
                                        .jsonBody,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()
                                      ?.toList() ??
                                  [];
                              return Stack(
                                children:
                                    List.generate(cards.length, (cardsIndex) {
                                  final cardsItem = cards[cardsIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 400.0,
                                                  child: ServicesPopUpWidget(
                                                    cardNumber:
                                                        (ListCardsNuveiCall
                                                                .last4digits(
                                                      listcardsCopy2CopyListCardsNuveiResponse
                                                          .jsonBody,
                                                    ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()[cardsIndex],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        width: 358.0,
                                        height: 213.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              ListCardsNuveiCall.cardType(
                                                        listcardsCopy2CopyListCardsNuveiResponse
                                                            .jsonBody,
                                                      )[cardsIndex] ==
                                                      FFAppState().visa
                                                  ? 'http://gseii.org/site/wp-content/uploads/2014/05/blue-gradient-wallpaper.jpg'
                                                  : 'https://c4.wallpaperflare.com/wallpaper/988/889/137/simple-gradient-minimalism-wallpaper-preview.jpg',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  27.0, 0.0, 27.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 33.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        ListCardsNuveiCall
                                                                    .cardType(
                                                                  listcardsCopy2CopyListCardsNuveiResponse
                                                                      .jsonBody,
                                                                )[cardsIndex] ==
                                                                FFAppState()
                                                                    .mastercard
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 30.0),
                                                child: Text(
                                                  ' **** **** **** ${(ListCardsNuveiCall.last4digits(
                                                    listcardsCopy2CopyListCardsNuveiResponse
                                                        .jsonBody,
                                                  ) as List).map<String>((s) => s.toString()).toList()[cardsIndex]}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Text(
                                                          'Card holder name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        (ListCardsNuveiCall
                                                                .name(
                                                          listcardsCopy2CopyListCardsNuveiResponse
                                                              .jsonBody,
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()[
                                                                cardsIndex]
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              'Expiry Date',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${(ListCardsNuveiCall.month(
                                                              listcardsCopy2CopyListCardsNuveiResponse
                                                                  .jsonBody,
                                                            ) as List).map<String>((s) => s.toString()).toList()[cardsIndex].toString()}/${functions.newCustomFunction2((ListCardsNuveiCall.year(
                                                              listcardsCopy2CopyListCardsNuveiResponse
                                                                  .jsonBody,
                                                            ) as List).map<String>((s) => s.toString()).toList()[cardsIndex].toString())}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
