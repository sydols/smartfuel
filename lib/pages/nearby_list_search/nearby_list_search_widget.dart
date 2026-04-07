import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nearby_list_search_model.dart';
export 'nearby_list_search_model.dart';

class NearbyListSearchWidget extends StatefulWidget {
  const NearbyListSearchWidget({super.key});

  static String routeName = 'NearbyListSearch';
  static String routePath = '/nearbyListSearch';

  @override
  State<NearbyListSearchWidget> createState() => _NearbyListSearchWidgetState();
}

class _NearbyListSearchWidgetState extends State<NearbyListSearchWidget> {
  late NearbyListSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearbyListSearchModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NearbyListSearch'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEARBY_LIST_SEARCH_NearbyListSearch_ON_I');
      if (getRemoteConfigBool('enable_price_notifications') == true) {
        logFirebaseEvent('NearbyListSearch_google_analytics_event');
        logFirebaseEvent(' session_start');
        logFirebaseEvent('NearbyListSearch_request_permissions');
        await requestPermission(notificationsPermission);
        logFirebaseEvent('NearbyListSearch_custom_action');
        await actions.subscribeToPriceAlerts();
      } else {
        logFirebaseEvent('NearbyListSearch_google_analytics_event');
        logFirebaseEvent(' session_start');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: Text(
                        'SmartFuel',
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  font: GoogleFonts.glory(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .fontStyle,
                                ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Screenshot_2026-03-09_at_1.51_Background_Removed.13_PM.png',
                        width: 75.0,
                        height: 75.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'Stations Near You',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          font: GoogleFonts.glory(
                            fontWeight: FlutterFlowTheme.of(context)
                                .displayMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displayMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .displayMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displayMedium
                              .fontStyle,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 400.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Builder(
                            builder: (context) {
                              final stationItem =
                                  _model.finalStationsList.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: stationItem.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, stationItemIndex) {
                                  final stationItemItem =
                                      stationItem[stationItemIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'NEARBY_LIST_SEARCH_Container_shgud9ym_ON');
                                      logFirebaseEvent(
                                          'Container_backend_call');
                                      _model.apiResultglv =
                                          await GoogleGeocodingCall.call(
                                        addressString: getJsonField(
                                          stationItemItem,
                                          r'''$.formattedAddress''',
                                        ).toString(),
                                      );

                                      if ((_model.apiResultglv?.succeeded ??
                                              true) ==
                                          true) {
                                        logFirebaseEvent(
                                            'Container_launch_u_r_l');
                                        await launchURL(
                                            'https://www.google.com/maps/dir/?api=1&origin=${_model.placePickerStartValue.address}&destination=${getJsonField(
                                          stationItemItem,
                                          r'''$.lat''',
                                        ).toString()},${getJsonField(
                                          stationItemItem,
                                          r'''$.lng''',
                                        ).toString()}');
                                      } else {
                                        logFirebaseEvent(
                                            'Container_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Error retrieving locations',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    getJsonField(
                                                      stationItemItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.glory(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    stationItemItem,
                                                    r'''$.price''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.glory(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    getJsonField(
                                                      stationItemItem,
                                                      r'''$.address''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.glory(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Text(
                                                    '${getJsonField(
                                                      stationItemItem,
                                                      r'''$.distance''',
                                                    ).toString()} mi',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.glory(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (!functions
                                                        .isEvChargerByName(
                                                            getJsonField(
                                                      stationItemItem,
                                                      r'''$.name''',
                                                    ).toString()) ||
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.vehicleType,
                                                            '') ==
                                                        'Gas'))
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Icon(
                                                      Icons
                                                          .local_gas_station_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                if (functions.isEvChargerByName(
                                                        getJsonField(
                                                      stationItemItem,
                                                      r'''$.name''',
                                                    ).toString()) ||
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.vehicleType,
                                                            '') ==
                                                        'Electric'))
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Icon(
                                                      Icons
                                                          .charging_station_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 24.0,
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
                            },
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                      androidGoogleMapsApiKey:
                          'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                      webGoogleMapsApiKey:
                          'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                      onSelect: (place) async {
                        safeSetState(
                            () => _model.placePickerStartValue = place);
                      },
                      defaultText: 'Where are you starting?',
                      buttonOptions: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.glory(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'NEARBY_LIST_SEARCH_FIND_STATIONS_NEARBY_');
                          logFirebaseEvent('Button_backend_call');
                          _model.apiResultNearby =
                              await GoogleMapsSearchNearbyCall.call(
                            lat: functions.currLocationToLat(
                                _model.placePickerStartValue.latLng),
                            lng: functions.currLocationtoLng(
                                _model.placePickerStartValue.latLng),
                            radius: 16000.0,
                            resultCount: 10,
                            typesJson: functions.getStationTypes(valueOrDefault(
                                currentUserDocument?.vehicleType, '')),
                          );

                          if ((_model.apiResultNearby?.succeeded ?? true)) {
                            logFirebaseEvent('Button_update_page_state');
                            _model.cleanStations = getJsonField(
                              (_model.apiResultNearby?.jsonBody ?? ''),
                              r'''$.places''',
                              true,
                            )!
                                .toList()
                                .cast<dynamic>();
                            safeSetState(() {});
                            for (int loop1Index = 0;
                                loop1Index < _model.cleanStations.length;
                                loop1Index++) {
                              final currentLoop1Item =
                                  _model.cleanStations[loop1Index];
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResultLatLng =
                                  await GoogleGeocodingCall.call(
                                addressString: getJsonField(
                                  currentLoop1Item,
                                  r'''$.formattedAddress''',
                                ).toString(),
                              );

                              if ((_model.apiResultLatLng?.succeeded ?? true) ==
                                  true) {
                                logFirebaseEvent('Button_backend_call');
                                _model.pricingApiResult =
                                    await GasStationListCall.call();

                                logFirebaseEvent('Button_update_page_state');
                                _model.addToFinalStationsList(
                                    functions.buildStationJson(
                                        getJsonField(
                                          currentLoop1Item,
                                          r'''$.displayName.text''',
                                        ).toString(),
                                        getJsonField(
                                          currentLoop1Item,
                                          r'''$.formattedAddress''',
                                        ).toString(),
                                        getJsonField(
                                          (_model.apiResultLatLng?.jsonBody ??
                                              ''),
                                          r'''$.results[0].geometry.location.lat''',
                                        ),
                                        getJsonField(
                                          (_model.apiResultLatLng?.jsonBody ??
                                              ''),
                                          r'''$.results[0].geometry.location.lng''',
                                        ),
                                        functions.calculateDistanceInMiles(
                                            _model.placePickerStartValue.latLng,
                                            functions.safeBuildLatLng(
                                                getJsonField(
                                                  (_model.apiResultLatLng
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.results[0].geometry.location.lat''',
                                                ),
                                                getJsonField(
                                                  (_model.apiResultLatLng
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.results[0].geometry.location.lng''',
                                                ))),
                                        (_model.pricingApiResult?.jsonBody ??
                                            '')));
                                logFirebaseEvent('Button_wait__delay');
                                await Future.delayed(
                                  Duration(
                                    milliseconds: 100,
                                  ),
                                );
                                logFirebaseEvent(
                                    'Button_google_analytics_event');
                                logFirebaseEvent(
                                  'gas_search',
                                  parameters: {
                                    'variant': getRemoteConfigBool(
                                        'enable_price_notifications'),
                                  },
                                );
                              }
                            }
                          } else {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Error seaching nearby, try again',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Find Stations Nearby',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.glory(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
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
