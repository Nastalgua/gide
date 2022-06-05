import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeResultPage extends StatefulWidget {
  const QRCodeResultPage({ Key? key }) : super(key: key);

  @override
  State<QRCodeResultPage> createState() => _QRCodeResultPageState();
}

class _QRCodeResultPageState extends State<QRCodeResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QrImage(data: "https://github.com/",)
          ],
        ),
      ),
    );
  }
}