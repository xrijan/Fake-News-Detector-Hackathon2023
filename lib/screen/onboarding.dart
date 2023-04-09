import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/reporter.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          SizedBox(
          height: 60,
          width: 220,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.indigo),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/google_icon.webp',
                  width: 24, // Set the desired image width
                  height: 24, // Set the desired image height// Set the desired image color
                ),
                const SizedBox(width: 8), // Add spacing between the icon and text
                const Text('Sign in with Google',),
              ],
            ),
          ),
        ),

        const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
