import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  String? _result;

  Future<void> _startScan() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _result = null; // reset
      });

      await _sendImageToServer(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  Future<void> _sendImageToServer(File imageFile) async {
    final uri = Uri.parse(
      'http://10.17.51.251:5000/predict',
    ); // ✅ Change if running on real device
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        setState(() {
          _result =
              "Prediction: ${jsonResponse['predicted_class']}\nConfidence: ${jsonResponse['confidence'] * 100}%";
        });
      } else {
        setState(() {
          _result = "Failed to get prediction. Status: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/scanbg.png', fit: BoxFit.cover),
          Container(
            color: Colors.black.withOpacity(0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                      'Hold still, we’re processing',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Take a clear photo of the front of your plant',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    if (_image != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.file(_image!, height: 160),
                      ),
                    if (_result != null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _result!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      const Text(
                        'Start Scan',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: _startScan,
                        child: const Icon(
                          Icons.qr_code_scanner,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
