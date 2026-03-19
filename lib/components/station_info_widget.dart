import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'station_info_model.dart';
export 'station_info_model.dart';

class StationInfoWidget extends StatefulWidget {
  const StationInfoWidget({super.key});

  @override
  State<StationInfoWidget> createState() => _StationInfoWidgetState();
}

class _StationInfoWidgetState extends State<StationInfoWidget> {
  late StationInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StationInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
