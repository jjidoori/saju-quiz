/// lunar 패키지가 반환하는 한자(중국어 간체) 결과를,
/// 지혜님 앱에서 쓰는 한국어 명리학 용어로 변환하는 유틸리티.
class SajuTranslate {
  // 천간 10개
  static const Map<String, String> _gan = {
    '甲': '갑', '乙': '을', '丙': '병', '丁': '정', '戊': '무',
    '己': '기', '庚': '경', '辛': '신', '壬': '임', '癸': '계',
  };

  // 지지 12개
  static const Map<String, String> _zhi = {
    '子': '자', '丑': '축', '寅': '인', '卯': '묘', '辰': '진', '巳': '사',
    '午': '오', '未': '미', '申': '신', '酉': '유', '戌': '술', '亥': '해',
  };

  // 오행 5개
  static const Map<String, String> _wuxing = {
    '木': '목', '火': '화', '土': '토', '金': '금', '水': '수',
  };

  // 십성 10개 (라이브러리는 편관을 七殺/칠살로 표기하나, 앱 용어인 편관으로 통일)
  static const Map<String, String> _shishen = {
    '比肩': '비견', '劫财': '겁재',
    '食神': '식신', '伤官': '상관',
    '正财': '정재', '偏财': '편재',
    '正官': '정관', '七杀': '편관',
    '正印': '정인', '偏印': '편인',
  };

  // 납음오행 60갑자 전체
  static const Map<String, String> _nayin = {
    '海中金': '해중금', '沙中金': '사중금',
    '炉中火': '노중화', '山下火': '산하화',
    '大林木': '대림목', '平地木': '평지목',
    '路旁土': '노방토', '壁上土': '벽상토',
    '剑锋金': '검봉금', '金箔金': '금박금',
    '山头火': '산두화', '覆灯火': '복등화',
    '涧下水': '간하수', '天河水': '천하수',
    '城头土': '성두토', '大驿土': '대역토',
    '白蜡金': '백랍금', '钗钏金': '채천금',
    '杨柳木': '양류목', '桑柘木': '상자목',
    '泉中水': '천중수', '大溪水': '대계수',
    '屋上土': '옥상토', '沙中土': '사중토',
    '霹雳火': '벽력화', '天上火': '천상화',
    '松柏木': '송백목', '石榴木': '석류목',
    '长流水': '장류수', '大海水': '대해수',
  };

  /// "甲子" 같은 2글자 간지 문자열을 "갑자"로 변환
  static String ganzhi(String hanja) {
    if (hanja.length != 2) return hanja;
    final g = _gan[hanja[0]] ?? hanja[0];
    final z = _zhi[hanja[1]] ?? hanja[1];
    return '$g$z';
  }

  /// 천간 한 글자 변환 (예: 甲 → 갑)
  static String gan(String hanja) => _gan[hanja] ?? hanja;

  /// 지지 한 글자 변환 (예: 子 → 자)
  static String zhi(String hanja) => _zhi[hanja] ?? hanja;

  /// 오행 변환 (예: 木 → 목). "木火" 처럼 2글자로 올 수도 있어 각 글자를 분리 변환
  static String wuxing(String hanja) {
    return hanja.split('').map((c) => _wuxing[c] ?? c).join('');
  }

  /// 십성 변환 (예: 食神 → 식신)
  static String shishen(String hanja) => _shishen[hanja] ?? hanja;

  /// 십성 리스트 변환 (지장간처럼 여러 개일 때)
  static List<String> shishenList(List<String> hanjaList) =>
      hanjaList.map(shishen).toList();

  /// 납음오행 변환 (예: 海中金 → 해중금)
  static String nayin(String hanja) => _nayin[hanja] ?? hanja;

  /// 오행 한 글자에 대한 간단한 설명 문구
  static String wuxingTip(String wuxingKo) {
    switch (wuxingKo) {
      case '목':
        return '성장과 시작의 기운. 새로운 도전에 유리한 하루예요.';
      case '화':
        return '열정과 표현의 기운. 적극적으로 나서기 좋은 하루예요.';
      case '토':
        return '안정과 신뢰의 기운. 차분히 다지기 좋은 하루예요.';
      case '금':
        return '결단과 정리의 기운. 매듭짓기 좋은 하루예요.';
      case '수':
        return '지혜와 유연함의 기운. 배움과 성찰에 좋은 하루예요.';
      default:
        return '오늘 하루도 균형 있게 보내보세요.';
    }
  }
}
