import 'package:flutter/material.dart';
import 'package:happyplant/color.dart';
import 'package:happyplant/home_screen.dart';

class WelcomePageView extends StatefulWidget {
  const WelcomePageView({super.key});

  @override
  State<WelcomePageView> createState() => _WelcomePageViewState();
}

class _WelcomePageViewState extends State<WelcomePageView> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/welcomescreenbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView(
          controller: _controller,
          children: [
            WelcomeScreen(
                title: 'Welcome to Plant Care!',
                text:
                    'This app helps you monitor and maintain the health of your plants.',
                showNextButton: true,
                nextButton: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }),
            WelcomeScreen(
              title: 'Get Started!',
              text: 'Click "Start" to begin your plant monitoring journey.',
              hasButton: true,
              getStartedButton: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String title;
  final String text;
  final bool hasButton;
  final VoidCallback? getStartedButton;
  final bool showNextButton;
  final VoidCallback? nextButton;

  const WelcomeScreen(
      {super.key,
      required this.title,
      required this.text,
      this.hasButton = false,
      this.getStartedButton,
      this.nextButton,
      this.showNextButton = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        Text(
          text,
          style: const TextStyle(
              fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30.0),
        if (hasButton)
          ElevatedButton(
            onPressed: getStartedButton,
            child: const Text('Start'),
          ),
        if (showNextButton)
          FloatingActionButton(
            onPressed: nextButton,
            focusColor: darkGreen,
            child: const Icon(Icons.arrow_forward_ios),
          ),
      ],
    );
  }
}
