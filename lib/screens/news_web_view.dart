import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class NewsDetail extends StatelessWidget {
  final String url;
  NewsDetail(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('News Api')),
        body:WebviewScaffold(
            url: url,
          withLocalStorage: true,
          withZoom: true,
          hidden: true,
          initialChild: Container(
              child: const Center(child: CircularProgressIndicator())),
                ),

    );
  }
}