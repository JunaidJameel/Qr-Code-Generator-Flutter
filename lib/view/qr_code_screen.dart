import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String data = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              const Text(
                'Qr Code Generator',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
              const SizedBox(height: 50),
              Center(
                child: Container(
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: data.isNotEmpty
                        ? QrImageView(
                            data: data, version: QrVersions.auto, size: 300)
                        : Image.network(
                            'https://i.pinimg.com/564x/29/bf/20/29bf20692457f72ebfaeed8a39e70b44.jpg',
                            fit: BoxFit.fill,
                          )),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: TextField(
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Type the Name ... !",
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70.0),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.amber,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 36.0,
                  vertical: 16.0,
                ),
                child: Text(
                  data.isEmpty ? "Generate QR Code" : "Capture QR Code",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
