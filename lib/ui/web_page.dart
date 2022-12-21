import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebViewController webViewController;
  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.bbc.com'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: SafeArea(
          child: Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebViewWidget(
                controller: webViewController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
