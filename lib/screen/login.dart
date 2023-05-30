import 'package:flutter/material.dart';
import 'package:news_app/screen/News%20Updates/news_home.dart';
import 'package:provider/provider.dart';
import '../helper/user_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/reporter.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [

              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: isSigningIn
                    ?
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : SizedBox(
                  height: 60,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isSigningIn = true;
                      });
                      userProvider.signInWithGoogle();
                      setState(() {
                        isSigningIn = false;
                      });
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const NewsHome(),
                          ),
                        );
                      }
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
                          height:
                          24, // Set the desired image height// Set the desired image color
                        ),
                        const SizedBox(
                            width: 8), // Add spacing between the icon and text
                        const Text(
                          'Sign in with Google',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}