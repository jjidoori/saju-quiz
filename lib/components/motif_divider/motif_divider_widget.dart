import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'motif_divider_model.dart';
export 'motif_divider_model.dart';

class MotifDividerWidget extends StatefulWidget {
  const MotifDividerWidget({super.key});

  @override
  State<MotifDividerWidget> createState() => _MotifDividerWidgetState();
}

class _MotifDividerWidgetState extends State<MotifDividerWidget> {
  late MotifDividerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MotifDividerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  FlutterFlowTheme.of(context).alternate,
                  FlutterFlowTheme.of(context).primary30
                ],
                stops: [0.0, 0.5, 1.0],
                begin: AlignmentDirectional(-1.0, 0.0),
                end: AlignmentDirectional(1.0, 0),
              ),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        Transform.rotate(
          angle: 45.0 * (math.pi / 180),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary40,
                width: 1.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  FlutterFlowTheme.of(context).alternate,
                  FlutterFlowTheme.of(context).primary30
                ],
                stops: [0.0, 0.5, 1.0],
                begin: AlignmentDirectional(1.0, 0.0),
                end: AlignmentDirectional(-1.0, 0),
              ),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
