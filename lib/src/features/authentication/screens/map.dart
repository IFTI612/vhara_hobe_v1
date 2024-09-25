import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/rent_list.dart';
import '../controllers/home_pageC.dart';
import 'add_list.dart';
import 'nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _mapState();
}

class _mapState extends State<MapView> {
  late final WebViewController controller;
  var prog = 0;
  int ind = 0;

  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onProgress: (progress) {
        setState(() {
          prog = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          prog = 0;
        });
      }))
      ..loadRequest(
        Uri.parse('https://www.google.com/maps'),
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if(prog > 0 && prog < 100)
              LinearProgressIndicator(
                // value: prog * 1.0,
                color: Colors.black,
                minHeight: 5,
              ),
          ],
        ),
      ),
    );
  }
}
