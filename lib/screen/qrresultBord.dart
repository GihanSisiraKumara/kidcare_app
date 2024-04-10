import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class QRResult extends StatelessWidget {
  final String code;
  final Function() cliseScreen;
  const QRResult({
    super.key,
    required this.code,
    required this.cliseScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return QRScannerOverlay();
                },
              ));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: const Text(
            "QR Result",
            style: TextStyle(
              fontSize: 22,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              QrImageView(
                data: "",
                size: 300,
                version: QrVersions.auto,
              ),
              const Text(
                "Scanner Qr",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                code,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: code));
                  },
                  child: const Text(
                    'Copy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
