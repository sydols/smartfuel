import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'on_route_search_model.dart';
export 'on_route_search_model.dart';

class OnRouteSearchWidget extends StatefulWidget {
  const OnRouteSearchWidget({super.key});

  static String routeName = 'onRouteSearch';
  static String routePath = '/onRouteSearch';

  @override
  State<OnRouteSearchWidget> createState() => _OnRouteSearchWidgetState();
}

class _OnRouteSearchWidgetState extends State<OnRouteSearchWidget> {
  late OnRouteSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnRouteSearchModel());
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
                    'Stations On Route',
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
                Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        _model.placePickerStartValue.latLng,
                    markers: _model.stationMarkers
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
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      final stationItem = _model.cleanStations.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: stationItem.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, stationItemIndex) {
                          final stationItemItem = stationItem[stationItemIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResultglv =
                                  await GoogleGeocodingCall.call(
                                addressString: getJsonField(
                                  stationItemItem,
                                  r'''$.formattedAddress''',
                                ).toString(),
                              );

                              if ((_model.apiResultglv?.succeeded ?? true) ==
                                  true) {
                                await launchURL(
                                    'https://www.google.com/maps/dir/?api=1&origin=${_model.placePickerStartValue.address}&destination=${_model.placePickerValue.address}&waypoints=${getJsonField(
                                  (_model.apiResultglv?.jsonBody ?? ''),
                                  r'''$.results[0].geometry.location.lat''',
                                ).toString()},${getJsonField(
                                  (_model.apiResultglv?.jsonBody ?? ''),
                                  r'''$.results[0].geometry.location.lng''',
                                ).toString()}');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error retrieving locations',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            getJsonField(
                                              stationItemItem,
                                              r'''$.displayName.text''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.glory(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          'Price',
                                          style: FlutterFlowTheme.of(context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            getJsonField(
                                              stationItemItem,
                                              r'''$.formattedAddress''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            shape: BoxShape.rectangle,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                          androidGoogleMapsApiKey:
                              'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                          webGoogleMapsApiKey:
                              'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                          onSelect: (place) async {
                            safeSetState(
                                () => _model.placePickerStartValue = place);
                            (await _model.googleMapsController.future)
                                .animateCamera(CameraUpdate.newLatLng(
                                    place.latLng.toGoogleMaps()));
                          },
                          defaultText: 'Where are you starting?',
                          buttonOptions: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                          androidGoogleMapsApiKey:
                              'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                          webGoogleMapsApiKey:
                              'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
                          onSelect: (place) async {
                            safeSetState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Where are you heading?',
                          buttonOptions: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.routeResponse = await GoogleMapsRouteCall.call(
                          originLat: valueOrDefault<double>(
                            functions.currLocationToLat(
                                _model.placePickerStartValue.latLng),
                            0.0,
                          ),
                          originLng: functions.currLocationtoLng(
                              _model.placePickerStartValue.latLng),
                          destLat: functions.currLocationToLat(
                              _model.placePickerValue.latLng),
                          destLng: functions.currLocationtoLng(
                              _model.placePickerValue.latLng),
                        );

                        if ((_model.routeResponse?.succeeded ?? true) == true) {
                          _model.filteredWaypoints = functions
                              .filterCoordinatesByDistance(
                                  functions
                                      .decodePolyline(getJsonField(
                                        (_model.routeResponse?.jsonBody ?? ''),
                                        r'''$.routes[0].polyline.encodedPolyline''',
                                      ).toString())
                                      .toList(),
                                  8046.0)
                              .toList()
                              .cast<LatLng>();
                          safeSetState(() {});
                          for (int loop1Index = 0;
                              loop1Index < _model.filteredWaypoints.length;
                              loop1Index++) {
                            final currentLoop1Item =
                                _model.filteredWaypoints[loop1Index];
                            _model.apiResultier =
                                await GoogleMapsSearchNearbyCall.call(
                              lat:
                                  functions.currLocationToLat(currentLoop1Item),
                              lng:
                                  functions.currLocationtoLng(currentLoop1Item),
                              radius: 1609.34,
                              resultCount: 2,
                            );

                            if ((_model.apiResultier?.succeeded ?? true) ==
                                true) {
                              await Future.delayed(
                                Duration(
                                  milliseconds: 250,
                                ),
                              );
                              _model.addToRawStations(getJsonField(
                                (_model.apiResultier?.jsonBody ?? ''),
                                r'''$.places''',
                              ));
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Unable to calculate route. Please check your connection or try a different address.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                ),
                              );
                            }
                          }
                          _model.cleanStations = functions
                              .deduplicateGasStations(
                                  _model.rawStations.toList())
                              .toList()
                              .cast<dynamic>();
                          safeSetState(() {});
                          for (int loop2Index = 0;
                              loop2Index < _model.rawStations.length;
                              loop2Index++) {
                            final currentLoop2Item =
                                _model.rawStations[loop2Index];
                            _model.apiResultLatLng =
                                await GoogleGeocodingCall.call(
                              addressString: getJsonField(
                                currentLoop2Item,
                                r'''$.formatted_address''',
                              ).toString(),
                            );

                            if ((_model.apiResultLatLng?.succeeded ?? true) ==
                                true) {
                              _model.addToStationMarkers(
                                  functions.safeBuildLatLng(
                                      getJsonField(
                                        currentLoop2Item,
                                        r'''$.results[0].geometry.location.lat''',
                                      ),
                                      getJsonField(
                                        currentLoop2Item,
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
                          _model.boundsResult = functions.calculateMapBounds(
                              functions
                                  .combineLocationstoList(
                                      _model.placePickerStartValue.latLng,
                                      _model.placePickerValue.latLng)
                                  .toList());
                          safeSetState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Unable to calculate route. Please check your connection or try a different address',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Find Stations Along Route',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
