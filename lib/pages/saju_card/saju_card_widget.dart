import '/flutter_flow/flutter_flow_util.dart';
import 'saju_card_model.dart';
export 'saju_card_model.dart';
import 'package:flutter/material.dart';

class SajuCardWidget extends StatefulWidget {
  const SajuCardWidget({super.key});

  @override
  State<SajuCardWidget> createState() => _SajuCardWidgetState();
}

class _SajuCardWidgetState extends State<SajuCardWidget> {
  late SajuCardModel _model;

  // 12개 일주별 조언 매핑
  final Map<String, String> dailyAdviceByIlju = {
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

  /// 오늘의 일주 조언 가져오기
  String _getTodayAdvice(String ilju) {
    return dailyAdviceByIlju[ilju] ?? '오늘 하루도 균형있게 보내세요.';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6D3),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '오늘의 일진',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6B4423),
            ),
          ),
          const SizedBox(height: 8.0),
          
          StreamBuilder<Map<String, dynamic>>(
            stream: FirebaseFirestore.instance
                .collection('daily_challenge')
                .doc(DateFormat('yyyyMMdd').format(DateTime.now()))
                .snapshots()
                .map((doc) => doc.data() ?? {}),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('로딩 중...');
              }

              String ilju = snapshot.data?['ilju'] ?? '경신';
              String advice = _getTodayAdvice(ilju);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ilju,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: const Color(0xFF8B6F47),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  
                  Text(
                    advice,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF6B4423),
                      height: 1.5,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
