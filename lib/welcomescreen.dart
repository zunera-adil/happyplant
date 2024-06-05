import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                title: 'Welcome to Happy Plant!',
                text:
                    'Happy Plant help you to monitor and maintain the health of your plants.',
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
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 300.h,
          width: 190.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            color: kShadowBlackColor.withAlpha(4),
            border: Border.all(
              width: 1.w,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),

        ),

        SizedBox(height: 30.h),
        if (hasButton)
          ElevatedButton(
            onPressed: getStartedButton,
            style: ElevatedButton.styleFrom(
              backgroundColor: lightGreen,
            ),
            child: Text('Start',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                  color: kShadowBlackColor,
                )),
          ),
        if (showNextButton)
          FloatingActionButton(
            onPressed: nextButton,
            //hoverColor: lightGreen,
            backgroundColor: lightGreen,
            child: Icon(
              Icons.arrow_forward_ios,
              color: kShadowBlackColor,
              size: 12.w,
            ),
          ),
      ],
    );
  }
}
