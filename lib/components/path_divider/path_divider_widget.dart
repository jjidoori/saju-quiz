import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'path_divider_model.dart';
export 'path_divider_model.dart';

class PathDividerWidget extends StatefulWidget {
  const PathDividerWidget({super.key});

  @override
  State<PathDividerWidget> createState() => _PathDividerWidgetState();
}

class _PathDividerWidgetState extends State<PathDividerWidget> {
  late PathDividerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PathDividerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
      child: Container(
        child: Container(
          width: 2.0,
          height: 32.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
