### 🚀 **Flutter Progress Loading**

[![pub package](https://img.shields.io/pub/v/flutter_progress_loading?style=flat)](https://pub.dev/packages/flutter_progress_loading)

*A lightweight, customizable Flutter loading indicator with progress tracking, animations, and toast
messages.*

#### 🌟 **Why use `flutter_progress_loading`?**

✅ Lightweight & Fast  
✅ Multiple Loading Styles (Dark, Light, Custom)  
✅ Progress Bar Support  
✅ Animated Custom Loaders  
✅ Configurable Toast Messages  
✅ `dismissOnTap` to allow user interactions

---

### 🛠 **Installation**

Add this package to your `pubspec.yaml`:
```yaml
dependencies:
  flutter_progress_loading: ^latest
```

Then, run:

```sh
flutter pub get
```

---

### 📌 **Basic Usage**

#### **Initialize in `MaterialApp`**
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Progress Loading',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      builder: ProgressLoading.init(),
    );
  }
}
```

#### **Show Different Loaders**
```dart
ProgressLoading.show
(
status: 'Loading...');

ProgressLoading.showProgress(0.3, status: 'Downloading...');

ProgressLoading.showSuccess('Great Success!');

ProgressLoading.showError('Oops! Something went wrong.');

ProgressLoading.showToast('This is a toast message.');

ProgressLoading.dismiss(); // Hide loader
```

#### **Listening to Loading Status**
```dart
ProgressLoading.addStatusCallback((status) {
print('Loading Status: $status');
});
```

To remove:
```dart
ProgressLoading.removeCallback(statusCallback);

ProgressLoading.removeAllCallbacks();
```

---

### 🎨 **Customization Options**

To **fully customize** the loader, modify these properties:

❗️**Note:**

- **`textColor`、`indicatorColor`、`progressColor`、`backgroundColor` only used
  for `ProgressLoadingStyle.custom`.**

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
ProgressLoading.instance..displayDuration = const Duration
(
milliseconds: 2000)
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
..customAnimation = CustomAnimation(
);
```

More indicatorType can see in
👉 [flutter_spinkit showcase](https://github.com/jogboms/flutter_spinkit#-showcase)

🔹 **See all properties in the [Full Customization Guide](#)**

---

### 🎬 **Custom Animations**

You can create a **custom loading animation** like this:

```dart
class CustomAnimation extends ProgressLoadingAnimation {
  @override
  Widget buildWidget(Widget child) {
    return ScaleTransition(scale: animation, child: child);
  }
}
```

👉 [See full example](https://github.com/KevalPatel4894/flutter_progress_loading/blob/main/example/lib/custom_animation.dart)

---

### 📝 **Changelog & Roadmap**

✅ Progress Indicator  
✅ Custom Animation Support  
⬜ Add More Animation Types (Upcoming)  
[View Full Changelog](./CHANGELOG.md)

---

### 💜 **License**

This package is licensed under the **MIT License**.  
[View License](./LICENSE)

---

### 📢 **Support & Contributions**

💙 If you like this package, give it a ⭐ on [GitHub](#)  
📢 Report issues or suggest features in the [Issues](#) section

---

