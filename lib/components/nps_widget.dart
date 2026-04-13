import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nps_model.dart';
export 'nps_model.dart';

class NpsWidget extends StatefulWidget {
  const NpsWidget({super.key});

  @override
  State<NpsWidget> createState() => _NpsWidgetState();
}

class _NpsWidgetState extends State<NpsWidget> {
  late NpsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NpsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.0,
      height: 325.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'How likely are you to reccommend SmartFuel to a friend?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.glory(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (valueOrDefault<bool>(
                    _model.oneStarF == false,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star_outline,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_oneStarUF_ON_TAP');
                        logFirebaseEvent('oneStarUF_update_component_state');
                        _model.localRating = 1;
                        _model.oneStarF = true;
                        _model.twoStarF = false;
                        _model.threeStarF = false;
                        _model.fourStarF = false;
                        _model.fiveStarF = false;
                        safeSetState(() {});
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.oneStarF == true,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_oneStarF_ON_TAP');
                        if (_model.localRating > 1) {
                          logFirebaseEvent('oneStarF_update_component_state');
                          _model.localRating = 1;
                          _model.oneStarF = true;
                          _model.twoStarF = false;
                          _model.threeStarF = false;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('oneStarF_update_component_state');
                          _model.localRating = 0;
                          _model.oneStarF = false;
                          _model.twoStarF = false;
                          _model.threeStarF = false;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        }
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.twoStarF == false,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star_outline,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_twoStarUF_ON_TAP');
                        logFirebaseEvent('twoStarUF_update_component_state');
                        _model.localRating = 2;
                        _model.oneStarF = true;
                        _model.twoStarF = true;
                        _model.threeStarF = false;
                        _model.fourStarF = false;
                        _model.fiveStarF = false;
                        safeSetState(() {});
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.twoStarF == true,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_twoStarF_ON_TAP');
                        if (_model.localRating > 2) {
                          logFirebaseEvent('twoStarF_update_component_state');
                          _model.localRating = 2;
                          _model.oneStarF = true;
                          _model.twoStarF = true;
                          _model.threeStarF = false;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('twoStarF_update_component_state');
                          _model.localRating = 0;
                          _model.oneStarF = true;
                          _model.twoStarF = false;
                          _model.threeStarF = false;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        }
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.threeStarF == false,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star_outline,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_threeStarUF_ON_TAP');
                        logFirebaseEvent('threeStarUF_update_component_state');
                        _model.localRating = 3;
                        _model.oneStarF = true;
                        _model.twoStarF = true;
                        _model.threeStarF = true;
                        _model.fourStarF = false;
                        _model.fiveStarF = false;
                        safeSetState(() {});
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.threeStarF == true,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_threeStarF_ON_TAP');
                        if (_model.localRating > 3) {
                          logFirebaseEvent('threeStarF_update_component_state');
                          _model.localRating = 3;
                          _model.oneStarF = true;
                          _model.twoStarF = true;
                          _model.threeStarF = true;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('threeStarF_update_component_state');
                          _model.localRating = 2;
                          _model.oneStarF = true;
                          _model.twoStarF = true;
                          _model.threeStarF = false;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        }
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.fourStarF == false,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star_outline,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_fourStarUF_ON_TAP');
                        logFirebaseEvent('fourStarUF_update_component_state');
                        _model.localRating = 4;
                        _model.oneStarF = true;
                        _model.twoStarF = true;
                        _model.threeStarF = true;
                        _model.fourStarF = true;
                        _model.fiveStarF = false;
                        safeSetState(() {});
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.fourStarF == true,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_fourStarF_ON_TAP');
                        if (_model.localRating > 4) {
                          logFirebaseEvent('fourStarF_update_component_state');
                          _model.localRating = 4;
                          _model.oneStarF = true;
                          _model.twoStarF = true;
                          _model.threeStarF = true;
                          _model.fourStarF = true;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('fourStarF_update_component_state');
                          _model.localRating = 3;
                          _model.oneStarF = true;
                          _model.twoStarF = true;
                          _model.threeStarF = true;
                          _model.fourStarF = false;
                          _model.fiveStarF = false;
                          safeSetState(() {});
                        }
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.fiveStarF == false,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star_outline,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_fiveStarUF_ON_TAP');
                        logFirebaseEvent('fiveStarUF_update_component_state');
                        _model.localRating = 5;
                        _model.oneStarF = true;
                        _model.twoStarF = true;
                        _model.threeStarF = true;
                        _model.fourStarF = true;
                        _model.fiveStarF = true;
                        safeSetState(() {});
                      },
                    ),
                  if (valueOrDefault<bool>(
                    _model.fiveStarF == true,
                    true,
                  ))
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 45.0,
                      icon: Icon(
                        Icons.star,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NPS_COMP_fiveStarF_ON_TAP');
                        logFirebaseEvent('fiveStarF_update_component_state');
                        _model.localRating = 4;
                        _model.oneStarF = true;
                        _model.twoStarF = true;
                        _model.threeStarF = true;
                        _model.fourStarF = true;
                        _model.fiveStarF = false;
                        safeSetState(() {});
                      },
                    ),
                ],
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('NPS_COMP_submitButton_ON_TAP');
                logFirebaseEvent('submitButton_backend_call');

                await currentUserReference!.update(createUsersRecordData(
                  rating: _model.localRating,
                ));
                logFirebaseEvent('submitButton_navigate_to');

                context.goNamed(NearbyListSearchWidget.routeName);
              },
              text: 'Submit',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.glory(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
