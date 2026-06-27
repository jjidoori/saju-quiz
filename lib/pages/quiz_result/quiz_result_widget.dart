import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_result_model.dart';
export 'quiz_result_model.dart';

class QuizResultWidget extends StatefulWidget {
  const QuizResultWidget({
  super.key,
  this.category,
  this.correctCount,
  this.subCategory,
});

final String? category;
final int? correctCount;
final String? subCategory;

  static String routeName = 'QuizResult';
  static String routePath = '/quizResult';

  @override
  State<QuizResultWidget> createState() => _QuizResultWidgetState();
}

class _QuizResultWidgetState extends State<QuizResultWidget> {
  late QuizResultModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizResultModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final correct = widget.correctCount ?? 0;
    final category = widget.category ?? '음양';
    final isPassed = correct >= 4;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 결과 아이콘
              Icon(
                isPassed ? Icons.emoji_events_rounded : Icons.sentiment_dissatisfied_rounded,
                color: isPassed
                    ? FlutterFlowTheme.of(context).success
                    : FlutterFlowTheme.of(context).error,
                size: 80.0,
              ),
              SizedBox(height: 24.0),
              // 결과 텍스트
              Text(
                isPassed ? '축하해요! 🎉' : '아쉬워요 😢',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  lineHeight: 1.2,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '5문제 중 $correct개 맞았어요!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.inter(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  lineHeight: 1.4,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                isPassed
                    ? '$category 마스터 완료!'
                    : '4개 이상 맞아야 통과예요.\n다시 한번 도전해보세요!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
              ),
              SizedBox(height: 48.0),
              // 버튼
              InkWell(
                onTap: () async {
                  if (isPassed) {
                    FFAppState().completeCategory(category);
                    context.goNamed(LearningPathWidget.routeName);
                  } else {
                    FFAppState().update(() {
                      FFAppState().todayQuestionIds = [];
                    });
                    context.pushNamed(
                      DailySajuChallengeWidget.routeName,
                      queryParameters: {
                        'questionNumber': serializeParam(1, ParamType.int),
                        'answeredCorrect': serializeParam(0, ParamType.int),
                       'category': serializeParam(category, ParamType.String),
'subCategory': serializeParam(widget.subCategory ?? '', ParamType.String),
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
                    content: isPassed ? '$category 완료! 다음 단계로' : '다시 도전!',
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
      ),
    );
  }
}
