import 'dart:math';
import '/backend/backend.dart';
import '/components/button/button_widget.dart';
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
    this.questionIds,
    this.category,
    this.subCategory,
  });

  final int? questionNumber;
  final int? answeredCorrect;
  final List<String>? questionIds;
  final String? category;
  final String? subCategory;

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
  List<String> _generatedIds = [];
  List<String> _shuffledOptions = [];

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
        final appState = FFAppState();

        // category/subCategory가 바뀌었으면 초기화
        final currentKey = '${widget.category}_${widget.subCategory}';
        if (_currentQuestion == 1 ||
            appState.todayQuestionIds.isEmpty ||
            (appState.todayQuestionIds.isNotEmpty &&
                appState.todayQuestionIds.first != currentKey)) {
          appState.todayQuestionIds = [currentKey];
          final seed = DateTime.now().millisecondsSinceEpoch;
          final filtered = widget.category != null
              ? questions.where((q) => q.category == widget.category).toList()
              : questions;

          List<String> selectedIds = [];

          // subCategory 정규화: '오행기초' -> '오행_기초' 처럼 언더바 누락 보정
          String? sub = widget.subCategory;
          if (sub != null && sub.isNotEmpty && widget.category != null) {
            final cat = widget.category!;
            if (sub.startsWith(cat) &&
                !sub.startsWith('${cat}_') &&
                sub.length > cat.length) {
              sub = '${cat}_${sub.substring(cat.length)}';
            }
          }

          if (sub != null && sub.isNotEmpty) {
            var subList = filtered.where((q) => q.subCategory == sub).toList();
            // 정규화한 이름으로 없으면 원본 이름으로 재시도
            if (subList.isEmpty && widget.subCategory != null) {
              subList = filtered
                  .where((q) => q.subCategory == widget.subCategory)
                  .toList();
            }
            subList.shuffle(Random(seed));
            selectedIds = subList.take(5).map((q) => q.reference.id).toList();
          }

          // 최후 안전장치: 못 뽑았으면 같은 category 안에서만 랜덤
          if (selectedIds.isEmpty) {
            final pool = filtered.isNotEmpty ? filtered : questions;
            pool.shuffle(Random(seed));
            selectedIds = pool.take(5).map((q) => q.reference.id).toList();
          }

          appState.todayQuestionIds = [currentKey, ...selectedIds];
        }

        // 인덱스 범위 보호
        if (_currentQuestion >= appState.todayQuestionIds.length) {
          safeSetState(() {
            _isLoading = false;
          });
          return;
        }

        final id = appState.todayQuestionIds[_currentQuestion];
        final matches = questions.where((q) => q.reference.id == id).toList();
        if (matches.isEmpty) {
          safeSetState(() {
            _isLoading = false;
          });
          return;
        }
        final target = matches.first;

        final opts = [...target.options];
        final correctAnswer = opts[target.correctIndex];
        final rng = Random();
        opts.shuffle(rng);
        final newCorrectIndex = opts.indexOf(correctAnswer);

        safeSetState(() {
          _randomQuestion = target;
          _model.correctIndex = newCorrectIndex;
          _shuffledOptions = opts;
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
              Padding(
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
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.4,
                          ),
                        ),
                        Text(
                          widget.category == '오행' &&
                                  widget.subCategory != null &&
                                  widget.subCategory!.isNotEmpty
                              ? '오행 ${widget.subCategory}'
                              : (widget.category ?? '음양'),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
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
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_currentQuestion / 5 문제',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.inter(),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        LinearProgressIndicator(
                          value: _currentQuestion / 5,
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '오늘의 사주 문제',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                              font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.3,
                            ),
                          ),
                          Text(
                            _randomQuestion!.question.isNotEmpty
                                ? _randomQuestion!.question
                                : _randomQuestion!.questionText,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
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
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  _shuffledOptions.isNotEmpty
                                      ? _shuffledOptions[index]
                                      : _randomQuestion!.options[index],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    font: GoogleFonts.inter(),
                                    color: _model.selectedIndex == index
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 32.0, 24.0, 32.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.selectedIndex == null) return;
                          final isCorrect =
                              _model.selectedIndex == _model.correctIndex;
                          final newCorrectCount =
                              _correctCount + (isCorrect ? 1 : 0);

                          context.pushNamed(
                            ResultExplanationWidget.routeName,
                            queryParameters: {
                              'questionId': serializeParam(
                                _randomQuestion?.reference.id ?? '',
                                ParamType.String,
                              ),
                              'questionIds': serializeParam(
                                widget.questionIds ?? _generatedIds,
                                ParamType.String,
                                isList: true,
                              ),
                              'category': serializeParam(
                                widget.category ?? '음양',
                                ParamType.String,
                              ),
                              'subCategory': serializeParam(
                                widget.subCategory ?? '',
                                ParamType.String,
                              ),
                              'isCorrect': serializeParam(
                                isCorrect,
                                ParamType.bool,
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
