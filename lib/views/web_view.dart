import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../shared/widgets/custom_widgets.dart';

class AppWebView extends StatelessWidget {
  final String title, url;

  const AppWebView({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    final loading = RxBool(true);
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) => loading(false),
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: CustomWidgets.appBar(title: title),
      body: Obx(() {
        if (loading.value) {
          return CustomWidgets.loader();
        }
        return WebViewWidget(controller: controller);
      }),
    );
  }
}
