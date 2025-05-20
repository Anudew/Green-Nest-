import 'package:flutter/material.dart';
import 'package:plantscanner/screens/next_screen.dart';

class ReadyToGoScreen extends StatelessWidget {
  const ReadyToGoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Top green section
              Container(
                height:
                    height * 0.6, // Slightly reduced to make space for overlap
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFAFCE8B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You are ready to go!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Turn your small spaces into a thriving garden with AI-powered guidance and sustainable farming tips!',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom white section
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 80,
                  ), // Pushes button down below image
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NextScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0CA70C),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Positioned image on the right side overlapping both sections
          Positioned(
            top: height * 0.35, // Adjust this value to control overlap amount
            right: 0,
            child: SizedBox(
              height: height * 0.5,
              width: width * 0.45,
              child: Image.asset(
                'assets/images/monitoring.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
