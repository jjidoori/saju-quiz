import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_nav2_model.dart';
export 'bottom_nav2_model.dart';

class BottomNav2Widget extends StatefulWidget {
  const BottomNav2Widget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  State<BottomNav2Widget> createState() => _BottomNav2WidgetState();
}

class _BottomNav2WidgetState extends State<BottomNav2Widget> {
  late BottomNav2Model _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNav2Model());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border(
          top: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: widget.selectedIndex == 0
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            activeIcon: Icon(
              Icons.home,
              color: FlutterFlowTheme.of(context).primary,
            ),
            label: '학습',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up_outlined,
              color: widget.selectedIndex == 1
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            activeIcon: Icon(
              Icons.trending_up,
              color: FlutterFlowTheme.of(context).primary,
            ),
            label: '여정',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.refresh_outlined,
              color: widget.selectedIndex == 2
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            activeIcon: Icon(
              Icons.refresh,
              color: FlutterFlowTheme.of(context).primary,
            ),
            label: '복습',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_outline,
              color: widget.selectedIndex == 3
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            activeIcon: Icon(
              Icons.star,
              color: FlutterFlowTheme.of(context).primary,
            ),
            label: '마스터',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: widget.selectedIndex == 4
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            activeIcon: Icon(
              Icons.person,
              color: FlutterFlowTheme.of(context).primary,
            ),
            label: '프로필',
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed(LearningPathWidget.routeName);
              break;
            case 1:
              context.goNamed(JourneyWidget.routeName);
              break;
            case 2:
              context.goNamed(PracticeWidget.routeName);
              break;
            case 3:
              context.goNamed(MasteryWidget.routeName);
              break;
            case 4:
              context.goNamed(ProfileWidget.routeName);
              break;
          }
        },
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
