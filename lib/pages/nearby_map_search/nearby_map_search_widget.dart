import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nearby_map_search_model.dart';
export 'nearby_map_search_model.dart';

class NearbyMapSearchWidget extends StatefulWidget {
  const NearbyMapSearchWidget({super.key});

  static String routeName = 'NearbyMapSearch';
  static String routePath = '/nearbyMapSearch';

  @override
  State<NearbyMapSearchWidget> createState() => _NearbyMapSearchWidgetState();
}

class _NearbyMapSearchWidgetState extends State<NearbyMapSearchWidget> {
  late NearbyMapSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearbyMapSearchModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NearbyMapSearch'});
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Text(
                          'SmartFuel',
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
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
                Padding(
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
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 350.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          _model.googleMapsCenter = latLng,
                      initialLocation: _model.googleMapsCenter ??=
                          _model.placePickerValue.latLng,
                      markers: _model.stationCoord
                          .map(
                            (marker) => FlutterFlowMarker(
                              marker.serialize(),
                              marker,
                            ),
                          )
                          .toList(),
                      markerColor: GoogleMarkerColor.violet,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14.0,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: false,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                      mapTakesGesturePreference: false,
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
                    safeSetState(() => _model.placePickerValue = place);
                    (await _model.googleMapsController.future).animateCamera(
                        CameraUpdate.newLatLng(place.latLng.toGoogleMaps()));
                  },
                  defaultText: 'Select Location',
                  icon: Icon(
                    Icons.place,
                    color: FlutterFlowTheme.of(context).info,
                    size: 16.0,
                  ),
                  buttonOptions: FFButtonOptions(
                    width: 200.0,
                    height: 40.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.glory(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    safeSetState(() {});
                    _model.placesResultCopy =
                        await GoogleMapsSearchNearbyCall.call(
                      lat: functions
                          .currLocationToLat(_model.placePickerValue.latLng),
                      lng: functions
                          .currLocationtoLng(_model.placePickerValue.latLng),
                      radius: 16000.0,
                      resultCount: 10,
                    );

                    if ((_model.placesResultCopy?.succeeded ?? true) == true) {
                      _model.rawStations = getJsonField(
                        (_model.placesResultCopy?.jsonBody ?? ''),
                        r'''$.places''',
                        true,
                      )!
                          .toList()
                          .cast<dynamic>();
                      for (int loop1Index = 0;
                          loop1Index <= _model.rawStations.length;
                          loop1Index++) {
                        final currentLoop1Item = _model.rawStations[loop1Index];
                        _model.apiResultLatLng = await GoogleGeocodingCall.call(
                          addressString: getJsonField(
                            currentLoop1Item,
                            r'''$.formattedAddress''',
                          ).toString(),
                        );

                        if ((_model.apiResultLatLng?.succeeded ?? true) ==
                            true) {
                          _model.addToStationCoord(functions.convertToLatLng(
                              getJsonField(
                                (_model.apiResultLatLng?.jsonBody ?? ''),
                                r'''$.results[0].geometry.location.lat''',
                              ),
                              getJsonField(
                                (_model.apiResultLatLng?.jsonBody ?? ''),
                                r'''$.results[0].geometry.location.lng''',
                              ))!);
                          safeSetState(() {});
                          await Future.delayed(
                            Duration(
                              milliseconds: 100,
                            ),
                          );
                        }
                      }
                      _model.stationCoord =
                          _model.stationLatLngs.toList().cast<LatLng>();
                      safeSetState(() {});
                      logFirebaseEvent(
                        'gas_search_success',
                        parameters: {
                          'station_count': _model.rawStations.length,
                          'user_status': currentUserDocument?.createdTime,
                        },
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Button',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.glory(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
