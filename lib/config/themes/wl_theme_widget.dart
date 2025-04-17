import 'package:flutter/material.dart';
import 'package:systemat_app/core/context/tb_context_widget.dart';
import 'package:systemat_app/thingsboard_client.dart';

typedef WlThemedWidgetBuilder = Widget Function(
  BuildContext context,
  ThemeData data,
  WhiteLabelingParams wlParams,
);

class WlThemeWidget extends TbContextWidget {
  final WlThemedWidgetBuilder wlThemedWidgetBuilder;

  WlThemeWidget(
    super.tbContext, {
    required this.wlThemedWidgetBuilder,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => WlThemeWidgetState();

  static WlThemeWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<WlThemeWidgetState>();
  }
}

class WlThemeWidgetState extends TbContextState<WlThemeWidget> {
  late WhiteLabelingParams _wlParams;
  late ThemeData _themeData;

  @override
  void initState() {
    super.initState();
    _loadWl();
  }

  void _loadWl() {
    _themeData = tbContext.wlService.themeData;
    _wlParams = tbContext.wlService.wlParams;
    if (mounted) {
      setState(() {});
    }
  }

  void wlUpdated() {
    setState(() {
      _themeData = tbContext.wlService.themeData;
      _wlParams = tbContext.wlService.wlParams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.wlThemedWidgetBuilder(context, _themeData, _wlParams);
  }
}
