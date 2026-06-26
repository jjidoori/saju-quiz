import '/backend/backend.dart';
import '/components/button/button_widget.dart';
import '/components/reminder_card/reminder_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'daily_saju_challenge_model.dart';
export 'daily_saju_challenge_model.dart';

class DailySajuChallengeWidget extends StatefulWidget {
  const DailySajuChallengeWidget({
    super.key,
    this.questionNumber,
    this.answeredCorrect,
  });

  final int? questionNumber;
  final int? answeredCorrect;

  static String routeName = 'DailySajuChallenge';
  static String routePath = '/dailySajuChallenge';

  @override
  State<DailySajuChallengeWidget> createState() =>
      _DailySajuChallengeWidgetState();
}

class _DailySajuChallengeWidgetState extends State<DailySajuChallengeWidget> {
  late DailySajuChallengeModel _model;
  DailyChallengeRecord? _randomQuestion;
  bool _isLoading = true;
  late int _currentQuestion;
  late int _correctCount;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailySajuChallengeModel());
    _currentQuestion = widget.questionNumber ?? 1;
    _correctCount = widget.answeredCorrect ?? 0;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final questions = await queryDailyChallengeRecordOnce();
      if (questions.isNotEmpty) {
        questions.shuffle();
        safeSetState(() {
          _randomQuestion = questions.first;
          _model.correctIndex = questions.first.correctIndex;
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (_randomQuestion == null) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Center(child: Text('문제를 불러올 수 없습니다.')),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 64.0, 24.0, 0.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 40.0,
          fillColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 20.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Daily Challenge',
              style: FlutterFlowTheme.of(context)
                  .titleMedium
                  .override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.4,
                  ),
            ),
            Text(
              '음양오행 기초',
              style: FlutterFlowTheme.of(context)
                  .labelSmall
                  .override(
                    font: GoogleFonts.inter(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    lineHeight: 1.2,
                  ),
            ),
          ],
        ),
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 40.0,
          fillColor: Colors.transparent,
          icon: Icon(
            Icons.info_outline_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 20.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ],
    ),
  ),
),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Daily Challenge',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.4,
                                ),
                          ),
                          Text(
                            '음양오행 기초',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ],
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: Colors.transparent,
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 진행바
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_currentQuestion / 5 문제',
                          style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.inter(),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        LinearProgressIndicator(
                          value: _currentQuestion / 5,
                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                          minHeight: 8.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '오늘의 사주 문제',
                            style: FlutterFlowTheme.of(context).labelLarge.override(
                              font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.3,
                            ),
                          ),
                          Text(
                            _randomQuestion!.questionText,
                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                              font: GoogleFonts.roboto(),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              lineHeight: 1.4,
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: _randomQuestion!.options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                          child: InkWell(
                            onTap: () {
                              safeSetState(() {
                                _model.selectedIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _model.selectedIndex == index
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  _randomQuestion!.options[index],
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: _model.selectedIndex == index
                                        ? FlutterFlowTheme.of(context).primaryBackground
                                        : FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final isCorrect = _model.selectedIndex == _model.correctIndex;
                              final newCorrectCount = _correctCount + (isCorrect ? 1 : 0);

                              context.pushNamed(
                                ResultExplanationWidget.routeName,
                                queryParameters: {
                                  'questionId': serializeParam(
                                    _randomQuestion?.reference.id ?? '',
                                    ParamType.String,
                                  ),
                                  'isCorrect': serializeParam(
                                    isCorrect,
                                    ParamType.bool,
                                  ),
                                  'explanationText': serializeParam(
                                    _randomQuestion?.explanationText ?? '',
                                    ParamType.String,
                                  ),
                                  'questionNumber': serializeParam(
                                    _currentQuestion,
                                    ParamType.int,
                                  ),
                                  'answeredCorrect': serializeParam(
                                    newCorrectCount,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: wrapWithModel(
                              model: _model.buttonModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ButtonWidget(
                                iconPresent: false,
                                iconEndPresent: false,
                                content: '정답 제출',
                                variant: 'primary',
                                size: 'large',
                                fullWidth: true,
                                loading: false,
                                disabled: false,
                              ),
                            ),
                          ),
                        ],
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
