import '/backend/backend.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_explanation_model.dart';
export 'result_explanation_model.dart';

class ResultExplanationWidget extends StatefulWidget {
  const ResultExplanationWidget({
    super.key,
    this.questionId,
    required this.isCorrect,
    this.questionNumber,
    this.answeredCorrect,
    this.questionIds,
    this.category,
    this.subCategory,
  });

  final String? questionId;
  final bool? isCorrect;
  final int? questionNumber;
  final int? answeredCorrect;
  final List<String>? questionIds;
  final String? category;
  final String? subCategory;

  static String routeName = 'ResultExplanation';
  static String routePath = '/resultExplanation';

  @override
  State<ResultExplanationWidget> createState() =>
      _ResultExplanationWidgetState();
}

class _ResultExplanationWidgetState extends State<ResultExplanationWidget> {
  late ResultExplanationModel _model;
  String? _explanationText;
  bool _isLoading = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultExplanationModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.questionId != null && widget.questionId!.isNotEmpty) {
        try {
          final docRef = DailyChallengeRecord.collection.doc(widget.questionId);
          final doc = await DailyChallengeRecord.getDocumentOnce(docRef);
          safeSetState(() {
            _explanationText = doc.explanation.isNotEmpty
                ? doc.explanation
                : doc.explanationText.isNotEmpty
                    ? doc.explanationText
                    : '해설을 불러올 수 없습니다.';
            _isLoading = false;
          });
        } catch (e) {
          safeSetState(() {
            _explanationText = '해설을 불러올 수 없습니다.';
            _isLoading = false;
          });
        }
      } else {
        safeSetState(() {
          _explanationText = '해설을 불러올 수 없습니다.';
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
    final currentQuestion = widget.questionNumber ?? 1;
    final correctCount = widget.answeredCorrect ?? 0;
    final isLastQuestion = currentQuestion >= 5;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 60.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$currentQuestion / 5 문제',
                            style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          LinearProgressIndicator(
                            value: currentQuestion / 5,
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
                      Container(
                        decoration: BoxDecoration(
                          color: widget.isCorrect == true
                              ? FlutterFlowTheme.of(context).success.withOpacity(0.1)
                              : FlutterFlowTheme.of(context).error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: widget.isCorrect == true
                                ? FlutterFlowTheme.of(context).success
                                : FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Row(
                            children: [
                              Icon(
                                widget.isCorrect == true
                                    ? Icons.check_circle_rounded
                                    : Icons.cancel_rounded,
                                color: widget.isCorrect == true
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).error,
                                size: 32.0,
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.isCorrect == true ? '정답입니다!' : '틀렸습니다',
                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                        font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 1.4,
                                      ),
                                    ),
                                    Text(
                                      '아래 해설을 확인하세요.',
                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                        font: GoogleFonts.inter(),
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32.0),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu_book_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    '해설',
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 16.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              _isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      _explanationText ?? '해설을 불러올 수 없습니다.',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(),
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                    ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    children: [
                      Container(height: 1.0, color: FlutterFlowTheme.of(context).alternate),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  if (isLastQuestion) {
                                    context.pushNamed(
                                      QuizResultWidget.routeName,
                                      queryParameters: {
                                        'category': serializeParam(
                                          widget.category ?? '음양',
                                          ParamType.String,
                                        ),
                                        'subCategory': serializeParam(
                                          widget.subCategory ?? '오행기초',
                                          ParamType.String,
                                        ),
                                        'correctCount': serializeParam(
                                          correctCount,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      DailySajuChallengeWidget.routeName,
                                      queryParameters: {
                                        'questionNumber': serializeParam(
                                          currentQuestion + 1,
                                          ParamType.int,
                                        ),
                                        'answeredCorrect': serializeParam(
                                          correctCount,
                                          ParamType.int,
                                        ),
                                        'questionIds': serializeParam(
                                          widget.questionIds ?? [],
                                          ParamType.String,
                                          isList: true,
                                        ),
                                        'category': serializeParam(
                                          widget.category ?? '음양',
                                          ParamType.String,
                                        ),
                                        'subCategory': serializeParam(
                                          widget.subCategory,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.buttonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ButtonWidget(
                                    iconPresent: false,
                                    iconEndPresent: false,
                                    content: isLastQuestion ? '결과 보기' : '다음 문제',
                                    variant: 'primary',
                                    size: 'large',
                                    fullWidth: true,
                                    loading: false,
                                    disabled: false,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 44.0,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              icon: Icon(
                                Icons.share_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
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
      ),
    );
  }
}
