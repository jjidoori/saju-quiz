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
  const DailySajuChallengeWidget({super.key});

  static String routeName = 'DailySajuChallenge';
  static String routePath = '/dailySajuChallenge';

  @override
  State<DailySajuChallengeWidget> createState() =>
      _DailySajuChallengeWidgetState();
}

class _DailySajuChallengeWidgetState extends State<DailySajuChallengeWidget> {
  late DailySajuChallengeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailySajuChallengeModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dailyQuestions = await queryDailyChallengeRecordOnce();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DailyChallengeRecord>>(
      stream: queryDailyChallengeRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
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
        List<DailyChallengeRecord> dailySajuChallengeDailyChallengeRecordList =
            snapshot.data!;
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final dailySajuChallengeDailyChallengeRecord =
            dailySajuChallengeDailyChallengeRecordList.isNotEmpty
                ? dailySajuChallengeDailyChallengeRecordList.first
                : null;

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
                          wrapWithModel(
                            model: _model.reminderCardModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ReminderCardWidget(),
                          ),
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
                                'Current Energy: Wood & Fire',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'QUESTION 4 OF 10',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                      lineHeight: 1.3,
                                    ),
                              ),
                              Text(
                                dailySajuChallengeDailyChallengeRecord?.questionText ?? '',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        StreamBuilder<DailyChallengeRecord>(
                          stream: DailyChallengeRecord.getDocument(
                              dailySajuChallengeDailyChallengeRecord!.reference),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final record = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: record.options.length,
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
                                          record.options[index],
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_fire_department_rounded,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 18.0,
                                  ),
                                  Text(
                                    '5 Day Streak - Keep it up!',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ResultExplanationWidget.routeName,
                                    queryParameters: {
                                      'questionId': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'isCorrect': serializeParam(
                                        _model.selectedIndex == _model.correctIndex,
                                        ParamType.bool,
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
                                    content: 'Submit Answer',
                                    variant: 'primary',
                                    size: 'large',
                                    fullWidth: true,
                                    loading: false,
                                    disabled: false,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
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
      },
    );
  }
}
