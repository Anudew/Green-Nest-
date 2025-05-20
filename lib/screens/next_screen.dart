import 'package:flutter/material.dart';
import 'package:plantscanner/screens/signup_screen.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFD8E6CC), // Light green top background
      body: Stack(
        children: [
          // Top background container (no text here now)
          Container(
            height: height,
            width: width,
            color: const Color(0xFFD8E6CC),
          ),

          // Bottom white container
          Positioned(
            top: height * 0.45,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.55,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80), // Pushes text below the image
                  const Text(
                    'Plant Care at Your Fingertips!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Snap a picture of your plant, and let AgriAI detect diseases, suggest care tips, and guide you to a greener future.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Overlapping image on the right side
          Positioned(
            top: height * 0.20,
            right: 0,
            child: SizedBox(
              height: height * 0.55,
              width: width * 0.45,
              child: Image.asset(
                'assets/images/plant.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
