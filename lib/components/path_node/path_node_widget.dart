import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'path_node_model.dart';
export 'path_node_model.dart';

class PathNodeWidget extends StatefulWidget {
  const PathNodeWidget({
    super.key,
    bool? locked,
    String? tapAction,
    bool? completed,
    this.icon,
    String? title,
    String? subtitle,
  })  : this.locked = locked ?? true,
        this.tapAction = tapAction ?? '',
        this.completed = completed ?? false,
        this.title = title ?? 'The Ten Heavenly Stems',
        this.subtitle = subtitle ?? 'Basic characters and their cosmic origins';

  final bool locked;
  final String tapAction;
  final bool completed;
  final Widget? icon;
  final String title;
  final String subtitle;

  @override
  State<PathNodeWidget> createState() => _PathNodeWidgetState();
}

class _PathNodeWidgetState extends State<PathNodeWidget> {
  late PathNodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PathNodeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: valueOrDefault<double>(
        valueOrDefault<bool>(
          widget.locked,
          true,
        )
            ? 0.6
            : 1.0,
        0.6,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: valueOrDefault<Color>(
              valueOrDefault<bool>(
                widget.locked,
                true,
              )
                  ? FlutterFlowTheme.of(context).alternate
                  : FlutterFlowTheme.of(context).alternate,
              FlutterFlowTheme.of(context).alternate,
            ),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (valueOrDefault<bool>(
                          widget.completed,
                          false,
                        )) {
                          return FlutterFlowTheme.of(context).success10;
                        } else if (valueOrDefault<bool>(
                          widget.locked,
                          true,
                        )) {
                          return FlutterFlowTheme.of(context)
                              .secondaryBackground;
                        } else {
                          return FlutterFlowTheme.of(context).primary10;
                        }
                      }(),
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: BorderRadius.circular(9999.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        if (valueOrDefault<bool>(
                          valueOrDefault<bool>(
                            widget.locked,
                            true,
                          )
                              ? true
                              : false,
                          true,
                        ))
                          Icon(
                            Icons.lock_rounded,
                            color: valueOrDefault<Color>(
                              () {
                                if (valueOrDefault<bool>(
                                  widget.completed,
                                  false,
                                )) {
                                  return FlutterFlowTheme.of(context).success;
                                } else if (valueOrDefault<bool>(
                                  widget.locked,
                                  true,
                                )) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryText;
                                } else {
                                  return FlutterFlowTheme.of(context).primary;
                                }
                              }(),
                              FlutterFlowTheme.of(context).secondaryText,
                            ),
                            size: 24.0,
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.title,
                          'The Ten Heavenly Stems',
                        ),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                              lineHeight: 1.4,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.subtitle,
                          'Basic characters and their cosmic origins',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                if (valueOrDefault<bool>(
                  widget.completed,
                  false,
                ))
                  Container(
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: FlutterFlowTheme.of(context).success,
                      size: 20.0,
                    ),
                  ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
