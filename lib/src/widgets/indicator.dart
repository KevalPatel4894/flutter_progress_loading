import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../progress_loading.dart';
import '../theme.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  final double _size = ProgressLoadingTheme.indicatorSize;

  /// indicator color of loading
  final Color _indicatorColor = ProgressLoadingTheme.indicatorColor;
  late Widget _indicator;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = _size;
    switch (ProgressLoadingTheme.indicatorType) {
      case ProgressLoadingIndicatorType.fadingCircle:
        _indicator = SpinKitFadingCircle(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.circle:
        _indicator = SpinKitCircle(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.threeBounce:
        _indicator = SpinKitThreeBounce(
          color: _indicatorColor,
          size: _size,
        );
        width = _size * 2;
        break;
      case ProgressLoadingIndicatorType.chasingDots:
        _indicator = SpinKitChasingDots(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.wave:
        _indicator = SpinKitWave(
          color: _indicatorColor,
          size: _size,
          itemCount: 6,
        );
        width = _size * 1.25;
        break;
      case ProgressLoadingIndicatorType.wanderingCubes:
        _indicator = SpinKitWanderingCubes(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.rotatingCircle:
        _indicator = SpinKitRotatingCircle(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.rotatingPlain:
        _indicator = SpinKitRotatingPlain(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.doubleBounce:
        _indicator = SpinKitDoubleBounce(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.fadingFour:
        _indicator = SpinKitFadingFour(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.fadingCube:
        _indicator = SpinKitFadingCube(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.pulse:
        _indicator = SpinKitPulse(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.cubeGrid:
        _indicator = SpinKitCubeGrid(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.foldingCube:
        _indicator = SpinKitFoldingCube(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.pumpingHeart:
        _indicator = SpinKitPumpingHeart(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.dualRing:
        _indicator = SpinKitDualRing(
          color: _indicatorColor,
          size: _size,
          lineWidth: ProgressLoadingTheme.lineWidth,
        );
        break;
      case ProgressLoadingIndicatorType.hourGlass:
        _indicator = SpinKitHourGlass(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.pouringHourGlass:
        _indicator = SpinKitPouringHourGlass(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.fadingGrid:
        _indicator = SpinKitFadingGrid(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.ring:
        _indicator = SpinKitRing(
          color: _indicatorColor,
          size: _size,
          lineWidth: ProgressLoadingTheme.lineWidth,
        );
        break;
      case ProgressLoadingIndicatorType.ripple:
        _indicator = SpinKitRipple(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.spinningCircle:
        _indicator = SpinKitSpinningCircle(
          color: _indicatorColor,
          size: _size,
        );
        break;
      case ProgressLoadingIndicatorType.squareCircle:
        _indicator = SpinKitSquareCircle(
          color: _indicatorColor,
          size: _size,
        );
        break;
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: _indicator,
    );
  }
}
