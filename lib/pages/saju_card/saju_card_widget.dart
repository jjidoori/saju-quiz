import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/saju_translate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunar/lunar.dart';
import 'saju_card_model.dart';
export 'saju_card_model.dart';

class SajuCardWidget extends StatefulWidget {
  const SajuCardWidget({super.key});

  static String routeName = 'SajuCard';
  static String routePath = '/sajuCard';

  @override
  State<SajuCardWidget> createState() => _SajuCardWidgetState();
}

class _SajuCardWidgetState extends State<SajuCardWidget> {
  late SajuCardModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // 오행별 카드 색상 (묘월당 오행 5색 체계)
  static const Map<String, Color> _wuxingColor = {
    '목': Color(0xFF1F6F5C), // 청록
    '화': Color(0xFF7B2D3A), // 버건디
    '토': Color(0xFFB08D57), // 황토
    '금': Color(0xFF9CA3AF), // 실버그레이
    '수': Color(0xFF1E3A5F), // 네이비
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SajuCardModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    // 오늘 날짜 기준 사주 계산
    final now = DateTime.now();
    final lunar = Lunar.fromDate(now);
    final eightChar = lunar.getEightChar();

    final dayGanZhiHanja = eightChar.getDay(); // 예: 甲子
    final dayGanZhi = SajuTranslate.ganzhi(dayGanZhiHanja);
    final dayWuxing = SajuTranslate.wuxing(eightChar.getDayWuXing());
    final dayNayin = SajuTranslate.nayin(eightChar.getDayNaYin());

    final yearGanZhi = SajuTranslate.ganzhi(eightChar.getYear());
    final monthGanZhi = SajuTranslate.ganzhi(eightChar.getMonth());

    final cardColor = _wuxingColor[dayWuxing] ?? theme.primary;
    final tip = SajuTranslate.wuxingTip(dayWuxing);

    final weekdayNames = ['월', '화', '수', '목', '금', '토', '일'];
    final dateLabel =
        '${now.year}년 ${now.month}월 ${now.day}일 (${weekdayNames[now.weekday - 1]})';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        appBar: AppBar(
          backgroundColor: theme.secondaryBackground,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: theme.primaryText),
            onPressed: () => context.pop(),
          ),
          title: Text(
            '오늘의 사주카드',
            style: theme.titleMedium.override(
              font: GoogleFonts.notoSansKr(fontWeight: FontWeight.bold),
              color: theme.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    dateLabel,
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.notoSansKr(),
                      color: theme.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // 메인 카드 (일주 기준)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: cardColor.withOpacity(0.35),
                          blurRadius: 24.0,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '오늘의 일진(日辰)',
                          style: theme.labelMedium.override(
                            font: GoogleFonts.notoSansKr(),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          dayGanZhi,
                          style: theme.displaySmall.override(
                            font: GoogleFonts.notoSansKr(
                                fontWeight: FontWeight.w900),
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 56.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '$dayGanZhiHanja  ·  $dayWuxing ($dayNayin)',
                          style: theme.bodyMedium.override(
                            font: GoogleFonts.notoSansKr(),
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            tip,
                            textAlign: TextAlign.center,
                            style: theme.bodyMedium.override(
                              font: GoogleFonts.notoSansKr(),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24.0),

                  // 년주/월주 참고 정보
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: theme.secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: theme.alternate),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '오늘의 년주·월주',
                          style: theme.labelMedium.override(
                            font: GoogleFonts.notoSansKr(
                                fontWeight: FontWeight.w600),
                            color: theme.primaryText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildMiniPillar(context, '년주', yearGanZhi),
                            _buildMiniPillar(context, '월주', monthGanZhi),
                            _buildMiniPillar(context, '일주', dayGanZhi),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12.0),
                  Text(
                    '※ 이 카드는 오늘 날짜의 일진을 기준으로 자동 계산됩니다.\n개인 사주는 "생년월일 맞춤 추천"에서 확인하실 수 있어요.',
                    textAlign: TextAlign.center,
                    style: theme.labelSmall.override(
                      font: GoogleFonts.notoSansKr(),
                      color: theme.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiniPillar(BuildContext context, String label, String value) {
    final theme = FlutterFlowTheme.of(context);
    return Column(
      children: [
        Text(
          label,
          style: theme.labelSmall.override(
            font: GoogleFonts.notoSansKr(),
            color: theme.secondaryText,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: theme.bodyLarge.override(
            font: GoogleFonts.notoSansKr(fontWeight: FontWeight.bold),
            color: theme.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
