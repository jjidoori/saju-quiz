import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/components/path_divider/path_divider_widget.dart';
import '/components/path_node/path_node_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learning_path_model.dart';
export 'learning_path_model.dart';

class LearningPathWidget extends StatefulWidget {
  const LearningPathWidget({super.key});

  static String routeName = 'LearningPath';
  static String routePath = '/learningPath';

  @override
  State<LearningPathWidget> createState() => _LearningPathWidgetState();
}

class _LearningPathWidgetState extends State<LearningPathWidget> {
  late LearningPathModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _categories = [
    {
      'category': '음양',
      'title': '음양 (陰陽)',
      'subtitle': '음과 양의 원리와 자연 현상',
      'icon': Icons.brightness_4_rounded,
    },
    {
      'category': '오행',
      'title': '오행 (五行)',
      'subtitle': '목·화·토·금·수의 상생과 상극',
      'icon': Icons.local_fire_department_rounded,
    },
    {
      'category': '천간',
      'title': '천간 (天干)',
      'subtitle': '갑·을·병·정·무·기·경·신·임·계',
      'icon': Icons.wb_sunny_rounded,
    },
    {
      'category': '지지',
      'title': '지지 (地支)',
      'subtitle': '자·축·인·묘·진·사·오·미·신·유·술·해',
      'icon': Icons.pets_rounded,
    },
    {
      'category': '십이운성',
      'title': '십이운성 (十二運星)',
      'subtitle': '장생·목욕·관대·건록·제왕·쇠·병·사·묘·절·태·양',
      'icon': Icons.loop_rounded,
    },
    {
      'category': '합/충/형/해/파',
      'title': '합·충·형·해·파',
      'subtitle': '천간합, 지지합, 충·형·해·파의 원리',
      'icon': Icons.compare_arrows_rounded,
    },
    {
      'category': '지장간',
      'title': '지장간 (地藏干)',
      'subtitle': '지지 속에 숨어있는 천간',
      'icon': Icons.layers_rounded,
    },
    {
      'category': '십성',
      'title': '십성 (十星)',
      'subtitle': '비겁·식상·재성·관성·인성의 원리',
      'icon': Icons.stars_rounded,
    },
    {
      'category': '납음오행',
      'title': '납음오행 (納音五行)',
      'subtitle': '60갑자의 소리와 오행의 관계',
      'icon': Icons.music_note_rounded,
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningPathModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final appState = FFAppState();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Saju Master Journey',
                          style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.3,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Learning Path',
                              style: FlutterFlowTheme.of(context).headlineLarge.override(
                                font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.2,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                context.goNamed(UserProfileProgressWidget.routeName);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary5,
                                  borderRadius: BorderRadius.circular(9999.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary20,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(Icons.stars_rounded,
                                          color: FlutterFlowTheme.of(context).primary, size: 16.0),
                                      Text(
                                        'Level ${appState.userLevel}',
                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
