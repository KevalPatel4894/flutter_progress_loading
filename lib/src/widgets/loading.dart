import 'package:flutter/material.dart';

import '../progress_loading.dart';
import './overlay_entry.dart';

class FlutterProgressLoading extends StatefulWidget {
  final Widget? child;

  const FlutterProgressLoading({
    super.key,
    required this.child,
  }) : assert(child != null);

  @override
  _FlutterProgressLoadingState createState() => _FlutterProgressLoadingState();
}

class _FlutterProgressLoadingState extends State<FlutterProgressLoading> {
  late ProgressLoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = ProgressLoadingOverlayEntry(
      builder: (BuildContext context) =>
          ProgressLoading.instance.w ?? Container(),
    );
    ProgressLoading.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          ProgressLoadingOverlayEntry(
            builder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
