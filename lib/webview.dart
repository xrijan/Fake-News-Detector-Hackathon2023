import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  final String url;
  const WebViewApp({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Web View App',style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.backspace,color: Colors.black,), onPressed: () {
          Navigator.pop(context);
        },),
        backgroundColor: Colors.white,
      ),
      body: widget.url.isEmpty ? const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ) : WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
