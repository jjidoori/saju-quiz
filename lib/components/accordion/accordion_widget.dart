import '/components/accordion_item/accordion_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'accordion_model.dart';
export 'accordion_model.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({
    super.key,
    String? title1,
    String? content1,
    String? title2,
    String? content2,
    String? title3,
    String? content3,
    bool? open1,
    bool? open2,
    bool? open3,
  })  : this.title1 = title1 ?? 'Yin-Yang Balance',
        this.content1 = content1 ??
            'The chart shows a strong Yang dominance (75%), suggesting an active, expressive, and outward-moving personality.',
        this.title2 = title2 ?? 'Five Elements (Wu Xing)',
        this.content2 = content2 ??
            'Wood and Fire are the dominant elements here, generating a \'Cycle of Birth\' that enhances intelligence.',
        this.title3 = title3 ?? 'Heavenly Stems Relationship',
        this.content3 = content3 ??
            'The interaction between Gap (Wood) and Byeong (Fire) creates a \'Wood-Fire Clarity\' configuration.',
        this.open1 = open1 ?? true,
        this.open2 = open2 ?? false,
        this.open3 = open3 ?? false;

  final String title1;
  final String content1;
  final String title2;
  final String content2;
  final String title3;
  final String content3;
  final bool open1;
  final bool open2;
  final bool open3;

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  late AccordionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccordionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            wrapWithModel(
              model: _model.accordionItemModel1,
              updateCallback: () => safeSetState(() {}),
              child: AccordionItemWidget(
                title: valueOrDefault<String>(
                  widget.title1,
                  'Yin-Yang Balance',
                ),
                content: valueOrDefault<String>(
                  widget.content1,
                  'The chart shows a strong Yang dominance (75%), suggesting an active, expressive, and outward-moving personality.',
                ),
                open: valueOrDefault<bool>(
                  valueOrDefault<bool>(
                    widget.open1,
                    true,
                  )
                      ? true
                      : false,
                  true,
                ),
                last: false,
              ),
            ),
            wrapWithModel(
              model: _model.accordionItemModel2,
              updateCallback: () => safeSetState(() {}),
              child: AccordionItemWidget(
                title: valueOrDefault<String>(
                  widget.title2,
                  'Five Elements (Wu Xing)',
                ),
                content: valueOrDefault<String>(
                  widget.content2,
                  'Wood and Fire are the dominant elements here, generating a \'Cycle of Birth\' that enhances intelligence.',
                ),
                open: valueOrDefault<bool>(
                  valueOrDefault<bool>(
                    widget.open2,
                    false,
                  )
                      ? true
                      : false,
                  false,
                ),
                last: false,
              ),
            ),
            wrapWithModel(
              model: _model.accordionItemModel3,
              updateCallback: () => safeSetState(() {}),
              child: AccordionItemWidget(
                title: valueOrDefault<String>(
                  widget.title3,
                  'Heavenly Stems Relationship',
                ),
                content: valueOrDefault<String>(
                  widget.content3,
                  'The interaction between Gap (Wood) and Byeong (Fire) creates a \'Wood-Fire Clarity\' configuration.',
                ),
                open: valueOrDefault<bool>(
                  valueOrDefault<bool>(
                    widget.open3,
                    false,
                  )
                      ? true
                      : false,
                  false,
                ),
                last: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
