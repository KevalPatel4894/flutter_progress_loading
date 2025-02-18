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
```dart
ProgressLoading.instance..loadingStyle = ProgressLoadingStyle.custom
  ..indicatorType = ProgressLoadingIndicatorType.fadingCircle..backgroundColor = Colors
    .black54..progressColor = Colors.blue..maskColor = Colors.black.withOpacity
(0.5)
..indicatorSize =
50.0
..
dismissOnTap
=
true;
```

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

