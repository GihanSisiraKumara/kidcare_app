import 'package:flutter/material.dart';
import 'package:kidcare/screen/qrresultBord.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class qrscannerBord extends StatefulWidget {
  const qrscannerBord({super.key, required String title});

  @override
  State<qrscannerBord> createState() => _qrscannerBordState();
}

class _qrscannerBordState extends State<qrscannerBord> {
  bool isFlashOn = false;
  bool isBackCamera = false;
  bool isScanCompleted = false;
  MobileScannerController cameracontroller = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'QR Scanner',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 247, 84, 84),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 249, 247, 247),
          leading: IconButton(
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all<double>(30),
              iconColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 252, 251, 251)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 234, 117, 117)),
            ),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFlashOn = !isFlashOn;
                });
                cameracontroller.toggleTorch();
              },
              icon: Icon(
                Icons.flash_on,
                color: isFlashOn ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isBackCamera = !isBackCamera;
                });
                cameracontroller.switchCamera();
              },
              icon: Icon(
                Icons.flip_camera_android,
                color: isBackCamera ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please the qr code scane here",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "The result will be shown here",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Stack(children: [
                  MobileScanner(
                    controller: cameracontroller,
                    allowDuplicates: true,
                    onDetect: (barcode, args) {
                      if (!isScanCompleted) {
                        isScanCompleted = true;
                        String code = barcode.rawValue ?? "---";
                        // Navigate to appropriate widget here
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return QRResult(
                              code: code,
                              cliseScreen: closeScreen,
                            );
                          },
                        ));
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.black26,
                    borderColor: Colors.amber.shade900,
                    borderRadius: 20,
                    borderStrokeWidth: 10,
                    scanAreaHeight: 250,
                    scanAreaWidth: 250,
                  )
                ]),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scan Properly to see results -",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 34, 32, 26),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
