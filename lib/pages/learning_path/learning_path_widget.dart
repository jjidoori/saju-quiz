import '/components/bottom_nav2/bottom_nav2_widget.dart';
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
  bool _ohangExpanded = false;
  bool _eumyangExpanded = false;

  final List<Map<String, dynamic>> _eumyangSubcategories = [
    {'subCategory': '음양_기초', 'title': '음양 기초', 'subtitle': '음과 양의 기본 개념'},
    {'subCategory': '음양_일반', 'title': '음양 일반', 'subtitle': '음과 양의 원리와 자연 현상'},
    {'subCategory': '음양_심화', 'title': '음양 심화', 'subtitle': '사주·한의학·역학에 적용되는 음양 원리'},
    {'subCategory': '음양_응용', 'title': '음양 응용', 'subtitle': '실전 상담에서의 음양 활용'},
  ];

  final List<Map<String, dynamic>> _ohangSubcategories = [
    {'subCategory': '오행_기초', 'title': '오행 기초', 'subtitle': '목·화·토·금·수의 특성'},
    {'subCategory': '오행_일반', 'title': '오행 일반', 'subtitle': '오행의 기본 원리와 관계'},
    {'subCategory': '상생', 'title': '오행 상생', 'subtitle': '수생목·목생화·화생토·토생금·금생수'},
    {'subCategory': '상극', 'title': '오행 상극', 'subtitle': '목극토·토극수·수극화·화극금·금극목'},
    {'subCategory': '과다', 'title': '오행 과다', 'subtitle': '특정 오행이 지나치게 강할 때'},
    {'subCategory': '부족', 'title': '오행 부족', 'subtitle': '특정 오행이 부족할 때'},
    {'subCategory': '오행_심화', 'title': '오행 심화', 'subtitle': '오행의 심화 이론'},
    {'subCategory': '오행_응용', 'title': '오행 응용', 'subtitle': '실전 상담에서의 오행 활용'},
  ];

  final List<Map<String, dynamic>> _categories = [
    {'category': '음양', 'title': '음양 (陰陽)', 'subtitle': '음과 양의 원리와 자연 현상', 'icon': Icons.brightness_4_rounded, 'hasSubcategories': true},
    {'category': '오행', 'title': '오행 (五行)', 'subtitle': '목·화·토·금·수의 상생과 상극', 'icon': Icons.local_fire_department_rounded, 'hasSubcategories': true},
    {'category': '천간', 'title': '천간 (天干)', 'subtitle': '갑·을·병·정·무·기·경·신·임·계', 'icon': Icons.wb_sunny_rounded},
    {'category': '지지', 'title': '지지 (地支)', 'subtitle': '자·축·인·묘·진·사·오·미·신·유·술·해', 'icon': Icons.pets_rounded},
    {'category': '십이운성', 'title': '십이운성 (十二運星)', 'subtitle': '장생·목욕·관대·건록·제왕·쇠·병·사·묘·절·태·양', 'icon': Icons.loop_rounded},
    {'category': '합/충/형/해/파', 'title': '합·충·형·해·파', 'subtitle': '천간합, 지지합, 충·형·해·파의 원리', 'icon': Icons.compare_arrows_rounded},
    {'category': '지장간', 'title': '지장간 (地藏干)', 'subtitle': '지지 속에 숨어있는 천간', 'icon': Icons.layers_rounded},
    {'category': '십성', 'title': '십성 (十星)', 'subtitle': '비겁·식상·재성·관성·인성의 원리', 'icon': Icons.stars_rounded},
    {'category': '납음오행', 'title': '납음오행 (納音五行)', 'subtitle': '60갑자의 소리와 오행의 관계', 'icon': Icons.music_note_rounded},
    {'category': '신살', 'title': '신살 (神殺)', 'subtitle': '사주에서 길신과 흉살의 작용', 'icon': Icons.auto_awesome_rounded},
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningPathModel());
    _ohangExpanded = false;
    _eumyangExpanded = false;
  }

  @override
  void dispose() {
