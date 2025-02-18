# flutter_progress_loading

[![pub package](https://img.shields.io/pub/v/flutter_progress_loading?style=flat)](https://pub.dev/packages/flutter_progress_loading) [![pub points](https://badges.bar/flutter_progress_loading/pub%20points)](https://pub.dev/packages/flutter_progress_loading/score) [![popularity](https://badges.bar/flutter_progress_loading/popularity)](https://pub.dev/packages/flutter_progress_loading/score) [![likes](https://badges.bar/flutter_progress_loading/likes)](https://pub.dev/packages/flutter_progress_loading/score) [![license](https://img.shields.io/github/license/KevalPatel4894/flutter_progress_loading?style=flat)](https://github.com/KevalPatel4894/flutter_progress_loading) [![stars](https://img.shields.io/github/stars/KevalPatel4894/flutter_progress_loading?style=social)](https://github.com/KevalPatel4894/flutter_progress_loading.git)

## Installing

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_progress_loading: ^latest
```

## Import

```dart
import 'package:flutter_progress_loading/flutter_progress_loading.dart';
```

## How to use

First, initialize `ProgressLoading` in your `MaterialApp`/`CupertinoApp`:

```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ProgressLoading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter ProgressLoading'),
      builder: ProgressLoading.init(),
    );
  }
}
```

Then, enjoy yourself:

```dart
ProgressLoading.show(status: 'loading...');

ProgressLoading.showProgress(0.3, status: 'downloading...');

ProgressLoading.showSuccess('Great Success!');

ProgressLoading.showError('Failed with Error');

ProgressLoading.showInfo('Useful Information.');

ProgressLoading.showToast('Toast');

ProgressLoading.dismiss();
```

Add loading status callback

```dart
ProgressLoading.addStatusCallback((status) {
  print('ProgressLoading Status $status');
});
```

Remove loading status callback(s)

```dart
ProgressLoading.removeCallback(statusCallback);

ProgressLoading.removeAllCallbacks();
```

## Customize

❗️**Note:**

- **`textColor`、`indicatorColor`、`progressColor`、`backgroundColor` only used for `ProgressLoadingStyle.custom`.**

- **`maskColor` only used for `ProgressLoadingMaskType.custom`.**

```dart
/// loading style, default [ProgressLoadingStyle.dark].
ProgressLoadingStyle loadingStyle;

/// loading indicator type, default [ProgressLoadingIndicatorType.fadingCircle].
ProgressLoadingIndicatorType indicatorType;

/// loading mask type, default [ProgressLoadingMaskType.none].
ProgressLoadingMaskType maskType;

/// toast position, default [ProgressLoadingToastPosition.center].
ProgressLoadingToastPosition toastPosition;

/// loading animationStyle, default [ProgressLoadingAnimationStyle.opacity].
ProgressLoadingAnimationStyle animationStyle;

/// loading custom animation, default null.
ProgressLoadingAnimation customAnimation;

/// textAlign of status, default [TextAlign.center].
TextAlign textAlign;

/// textStyle of status, default null.
TextStyle textStyle;

/// content padding of loading.
EdgeInsets contentPadding;

/// padding of [status].
EdgeInsets textPadding;

/// size of indicator, default 40.0.
double indicatorSize;

/// radius of loading, default 5.0.
double radius;

/// fontSize of loading, default 15.0.
double fontSize;

/// width of progress indicator, default 2.0.
double progressWidth;

/// width of indicator, default 4.0, only used for [ProgressLoadingIndicatorType.ring, ProgressLoadingIndicatorType.dualRing].
double lineWidth;

/// display duration of [showSuccess] [showError] [showInfo], default 2000ms.
Duration displayDuration;

/// animation duration of indicator, default 200ms.
Duration animationDuration;

/// color of loading status, only used for [ProgressLoadingStyle.custom].
Color textColor;

/// color of loading indicator, only used for [ProgressLoadingStyle.custom].
Color indicatorColor;

/// progress color of loading, only used for [ProgressLoadingStyle.custom].
Color progressColor;

/// background color of loading, only used for [ProgressLoadingStyle.custom].
Color backgroundColor;

/// mask color of loading, only used for [ProgressLoadingMaskType.custom].
Color maskColor;

/// should allow user interactions while loading is displayed.
bool userInteractions;

/// should dismiss on user tap.
bool dismissOnTap;

/// indicator widget of loading
Widget indicatorWidget;

/// success widget of loading
Widget successWidget;

/// error widget of loading
Widget errorWidget;

/// info widget of loading
Widget infoWidget;
```

Because of `ProgressLoading` is a singleton, so you can custom loading style any where like this:

```dart
ProgressLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = ProgressLoadingIndicatorType.fadingCircle
  ..loadingStyle = ProgressLoadingStyle.dark
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..progressColor = Colors.yellow
  ..backgroundColor = Colors.green
  ..indicatorColor = Colors.yellow
  ..textColor = Colors.yellow
  ..maskColor = Colors.blue.withOpacity(0.5)
  ..userInteractions = true
  ..dismissOnTap = false
  ..customAnimation = CustomAnimation();
```

More indicatorType can see in 👉 [flutter_spinkit showcase](https://github.com/jogboms/flutter_spinkit#-showcase)

## Custom Animation

example:
👉 [Custom Animation](https://github.com/KevalPatel4894/flutter_progress_loading/blob/main/example/lib/custom_animation.dart)

## Todo

- [x] add progress indicator

- [x] add custom animation

## Changelog

[CHANGELOG](./CHANGELOG.md)

## License

[MIT License](./LICENSE)

## ❤️❤️❤️

Thanks to [flutter_spinkit](https://github.com/jogboms/flutter_spinkit) ❤️

Supported by [JetBrains Open Source](https://www.jetbrains.com/community/opensource/#support)