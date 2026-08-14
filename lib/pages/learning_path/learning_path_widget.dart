// 12개 일주별 조언 (배너에서 사용)
  final Map<String, String> _dailyAdviceByIlju = {
    '갑자': '새로운 아이디어가 샘솟는 하루, 용기 있게 표현해보세요.',
    '을축': '차분한 마음으로 기초를 다지는 날, 꾸준함이 답입니다.',
    '병인': '활기찬 에너지가 흐르는 하루, 긍정적으로 행동하세요.',
    '정묘': '세밀한 감정이 풍부한 날, 자신의 마음에 귀 기울이세요.',
    '무진': '안정감 있게 중심을 잡는 날, 신뢰할 수 있는 선택을 하세요.',
    '기사': '따뜻한 배려의 마음이 넘치는 하루, 관계를 소중히 하세요.',
    '경오': '명확한 판단력이 돋보이는 날, 결단력 있게 나아가세요.',
    '신미': '섬세한 손길이 필요한 하루, 디테일을 챙기세요.',
    '임신': '흐르는 물처럼 유연한 마음의 하루, 변화를 즐기세요.',
    '계유': '깊이 있는 생각이 나오는 날, 통찰력을 믿고 나아가세요.',
    '갑술': '책임감이 강해지는 하루, 역할을 충실히 해내세요.',
    '을해': '자유로운 영혼이 움직이는 날, 창의성을 펼쳐보세요.',
  };

  Widget _buildSajuCardBanner(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>>(
      stream: FirebaseFirestore.instance
          .collection('daily_challenge')
          .doc(DateFormat('yyyyMMdd').format(DateTime.now()))
          .snapshots()
          .map((doc) => doc.data() ?? {}),
      builder: (context, snapshot) {
        String ilju = '경신';
        String advice = '오늘 하루도 균형있게 보내세요.';
        
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          ilju = snapshot.data!['ilju'] ?? '경신';
          advice = _dailyAdviceByIlju[ilju] ?? '오늘 하루도 균형있게 보내세요.';
        }

        return InkWell(
          onTap: () => context.pushNamed(SajuCardWidget.routeName),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).primary.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 28.0),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오늘의 일진',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.notoSansKr(fontWeight: FontWeight.bold),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            ilju,
                            style: FlutterFlowTheme.of(context).headlineSmall?.override(
                                  font: GoogleFonts.notoSansKr(),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: Colors.white, size: 24.0),
                  ],
                ),
                const SizedBox(height: 12.0),
                Text(
                  advice,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.notoSansKr(),
                        color: Colors.white.withOpacity(0.9),
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
