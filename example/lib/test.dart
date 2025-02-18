import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_progress_loading/flutter_progress_loading.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    // ProgressLoading.dismiss();
    ProgressLoading.showSuccess('Use in initState');
    ProgressLoading.addStatusCallback(statusCallback);
  }

  @override
  void deactivate() {
    ProgressLoading.dismiss();
    ProgressLoading.removeCallback(statusCallback);
    super.deactivate();
  }

  void statusCallback(ProgressLoadingStatus status) {
    debugPrint('Test ProgressLoading Status $status');
  }

  void loadData() async {
    try {
      await ProgressLoading.show();
      HttpClient client = HttpClient();
      HttpClientRequest request =
          await client.getUrl(Uri.parse('https://github.com'));
      HttpClientResponse response = await request.close();
      debugPrint(response.toString());
      await ProgressLoading.dismiss();
    } catch (e) {
      await ProgressLoading.showError(e.toString());
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('loadData'),
          onPressed: () {
            ProgressLoading.show(status: '加载中...');
          },
        ),
      ),
    );
  }
}
