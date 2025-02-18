import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_loading/flutter_progress_loading.dart';

import './custom_animation.dart';
import './test.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
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
    ..maskColor = Colors.blue.withAlpha((0.5 * 255).toInt())
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    super.initState();
    ProgressLoading.addStatusCallback((status) {
      debugPrint('ProgressLoading Status $status');
      if (status == ProgressLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    ProgressLoading.showSuccess('Use in initState');
    // ProgressLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(),
              Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: Text('open test page'),
                    onPressed: () {
                      _timer?.cancel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TestPage(),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: Text('dismiss'),
                    onPressed: () async {
                      _timer?.cancel();
                      await ProgressLoading.dismiss();
                      debugPrint('ProgressLoading dismiss');
                    },
                  ),
                  TextButton(
                    child: Text('show'),
                    onPressed: () async {
                      _timer?.cancel();
                      await ProgressLoading.show(
                        status: 'loading...',
                        maskType: ProgressLoadingMaskType.black,
                      );
                      debugPrint('ProgressLoading show');
                    },
                  ),
                  TextButton(
                    child: Text('showToast'),
                    onPressed: () {
                      _timer?.cancel();
                      ProgressLoading.showToast(
                        'Toast',
                      );
                    },
                  ),
                  TextButton(
                    child: Text('showSuccess'),
                    onPressed: () async {
                      _timer?.cancel();
                      await ProgressLoading.showSuccess('Great Success!');
                      debugPrint('ProgressLoading showSuccess');
                    },
                  ),
                  TextButton(
                    child: Text('showError'),
                    onPressed: () {
                      _timer?.cancel();
                      ProgressLoading.showError('Failed with Error');
                    },
                  ),
                  TextButton(
                    child: Text('showInfo'),
                    onPressed: () {
                      _timer?.cancel();
                      ProgressLoading.showInfo('Useful Information.');
                    },
                  ),
                  TextButton(
                    child: Text('showProgress'),
                    onPressed: () {
                      _progress = 0;
                      _timer?.cancel();
                      _timer = Timer.periodic(const Duration(milliseconds: 100),
                          (Timer timer) {
                        ProgressLoading.showProgress(_progress,
                            status: '${(_progress * 100).toStringAsFixed(0)}%');
                        _progress += 0.03;

                        if (_progress >= 1) {
                          _timer?.cancel();
                          ProgressLoading.dismiss();
                        }
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('Style'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<ProgressLoadingStyle>(
                        selectedColor: Colors.blue,
                        children: {
                          ProgressLoadingStyle.dark: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('dark'),
                          ),
                          ProgressLoadingStyle.light: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('light'),
                          ),
                          ProgressLoadingStyle.custom: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('custom'),
                          ),
                        },
                        onValueChanged: (value) {
                          ProgressLoading.instance.loadingStyle = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('MaskType'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<ProgressLoadingMaskType>(
                        selectedColor: Colors.blue,
                        children: {
                          ProgressLoadingMaskType.none: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('none'),
                          ),
                          ProgressLoadingMaskType.clear: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('clear'),
                          ),
                          ProgressLoadingMaskType.black: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('black'),
                          ),
                          ProgressLoadingMaskType.custom: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('custom'),
                          ),
                        },
                        onValueChanged: (value) {
                          ProgressLoading.instance.maskType = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('Toast Positon'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<
                          ProgressLoadingToastPosition>(
                        selectedColor: Colors.blue,
                        children: {
                          ProgressLoadingToastPosition.top: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('top'),
                          ),
                          ProgressLoadingToastPosition.center: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('center'),
                          ),
                          ProgressLoadingToastPosition.bottom: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('bottom'),
                          ),
                        },
                        onValueChanged: (value) {
                          ProgressLoading.instance.toastPosition = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('Animation Style'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<
                          ProgressLoadingAnimationStyle>(
                        selectedColor: Colors.blue,
                        children: {
                          ProgressLoadingAnimationStyle.opacity: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('opacity'),
                          ),
                          ProgressLoadingAnimationStyle.offset: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('offset'),
                          ),
                          ProgressLoadingAnimationStyle.scale: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('scale'),
                          ),
                          ProgressLoadingAnimationStyle.custom: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('custom'),
                          ),
                        },
                        onValueChanged: (value) {
                          ProgressLoading.instance.animationStyle = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 50.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text('IndicatorType(total: 23)'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<
                          ProgressLoadingIndicatorType>(
                        selectedColor: Colors.blue,
                        children: {
                          ProgressLoadingIndicatorType.circle: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('circle'),
                          ),
                          ProgressLoadingIndicatorType.wave: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('wave'),
                          ),
                          ProgressLoadingIndicatorType.ring: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('ring'),
                          ),
                          ProgressLoadingIndicatorType.pulse: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('pulse'),
                          ),
                          ProgressLoadingIndicatorType.cubeGrid: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('cubeGrid'),
                          ),
                          ProgressLoadingIndicatorType.threeBounce: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('threeBounce'),
                          ),
                        },
                        onValueChanged: (value) {
                          ProgressLoading.instance.indicatorType = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
