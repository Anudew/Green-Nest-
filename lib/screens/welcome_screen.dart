import 'package:flutter/material.dart';
import 'ready_to_go_screen.dart'; // Make sure this import is correct

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReadyToGoScreen()),
          );
        },
        child: Stack(
          children: [
            // Background Image
            SizedBox.expand(
              child: Image.asset(
                'assets/images/welcome.png',
                fit: BoxFit.cover,
              ),
            ),

            // Centered Content (aligned slightly to the left)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "GreenNest",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Grow Smart, Farm Sustainably!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
