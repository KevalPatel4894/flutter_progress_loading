import 'package:flutter/material.dart';

import './animations/animation.dart';
import './animations/offset_animation.dart';
import './animations/opacity_animation.dart';
import './animations/scale_animation.dart';
import './progress_loading.dart';

class ProgressLoadingTheme {
  /// color of indicator
  static Color get indicatorColor =>
      ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.custom
          ? ProgressLoading.instance.indicatorColor!
          : ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// progress color of loading
  static Color get progressColor =>
      ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.custom
          ? ProgressLoading.instance.progressColor!
          : ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// background color of loading
  static Color get backgroundColor =>
      ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.custom
          ? ProgressLoading.instance.backgroundColor!
          : ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.dark
              ? Colors.black.withOpacity(0.9)
              : Colors.white;

  /// boxShadow color of loading
  static List<BoxShadow>? get boxShadow =>
      ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.custom
          ? ProgressLoading.instance.boxShadow ?? [BoxShadow()]
          : null;

  /// font color of status
  static Color get textColor =>
      ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.custom
          ? ProgressLoading.instance.textColor!
          : ProgressLoading.instance.loadingStyle == ProgressLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// mask color of loading
  static Color maskColor(ProgressLoadingMaskType? maskType) {
    maskType ??= ProgressLoading.instance.maskType;
    return maskType == ProgressLoadingMaskType.custom
        ? ProgressLoading.instance.maskColor!
        : maskType == ProgressLoadingMaskType.black
            ? Colors.black.withOpacity(0.5)
            : Colors.transparent;
  }

  /// loading animation
  static ProgressLoadingAnimation get loadingAnimation {
    ProgressLoadingAnimation animation;
    switch (ProgressLoading.instance.animationStyle) {
      case ProgressLoadingAnimationStyle.custom:
        animation = ProgressLoading.instance.customAnimation!;
        break;
      case ProgressLoadingAnimationStyle.offset:
        animation = OffsetAnimation();
        break;
      case ProgressLoadingAnimationStyle.scale:
        animation = ScaleAnimation();
        break;
      default:
        animation = OpacityAnimation();
        break;
    }
    return animation;
  }

  /// font size of status
  static double get fontSize => ProgressLoading.instance.fontSize;

  /// size of indicator
  static double get indicatorSize => ProgressLoading.instance.indicatorSize;

  /// width of progress indicator
  static double get progressWidth => ProgressLoading.instance.progressWidth;

  /// width of indicator
  static double get lineWidth => ProgressLoading.instance.lineWidth;

  /// loading indicator type
  static ProgressLoadingIndicatorType get indicatorType =>
      ProgressLoading.instance.indicatorType;

  /// toast position
  static ProgressLoadingToastPosition get toastPosition =>
      ProgressLoading.instance.toastPosition;

  /// toast position
  static AlignmentGeometry alignment(ProgressLoadingToastPosition? position) =>
      position == ProgressLoadingToastPosition.bottom
          ? AlignmentDirectional.bottomCenter
          : (position == ProgressLoadingToastPosition.top
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.center);

  /// display duration
  static Duration get displayDuration =>
      ProgressLoading.instance.displayDuration;

  /// animation duration
  static Duration get animationDuration =>
      ProgressLoading.instance.animationDuration;

  /// contentPadding of loading
  static EdgeInsets get contentPadding =>
      ProgressLoading.instance.contentPadding;

  /// padding of status
  static EdgeInsets get textPadding => ProgressLoading.instance.textPadding;

  /// textAlign of status
  static TextAlign get textAlign => ProgressLoading.instance.textAlign;

  /// textStyle of status
  static TextStyle? get textStyle => ProgressLoading.instance.textStyle;

  /// radius of loading
  static double get radius => ProgressLoading.instance.radius;

  /// should dismiss on user tap
  static bool? get dismissOnTap => ProgressLoading.instance.dismissOnTap;

  static bool ignoring(ProgressLoadingMaskType? maskType) {
    maskType ??= ProgressLoading.instance.maskType;
    return ProgressLoading.instance.userInteractions ??
        (maskType == ProgressLoadingMaskType.none ? true : false);
  }
}
