import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helper/user_provider.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({Key? key}) : super(key: key);

  @override
  State<ProfileUi> createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  ///linkdin
  void _launchLinkedInProfile() async {
    final Uri url = Uri.parse('https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  ///github
  void _launchGitHubProfile() async {
    final Uri url = Uri.parse('https://github.com/xrijan');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  ///mail
  void _launchMail() async {
    final Uri url = Uri.parse('https://mail.google.com/mail/u/0/#inbox');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (user != null)
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    user.photoURL!,
                    fit: BoxFit.cover,
                  ),
                ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.backspace_outlined,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      userProvider.signOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),

          ///name

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              user!.displayName!,
              style: const TextStyle(fontSize: 24),
            ),
          ),

          ///email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              user.email!,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'About Developer ',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Rijan Rayamajhi.',
              style: TextStyle(fontSize: 16),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                'Currently pursuing  Undergraduate from Alliance University in Information and Technology. A Sophomore with sound knowledge in programming ‚mathematic and statics, computer architecture, computer networking, internet and web.',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Connect',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                    onTap: () async {
                      _launchLinkedInProfile();
                    },
                    child: Image.asset(
                      'assets/linkedin.png',
                      height: 40,
                    )),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    _launchGitHubProfile();
                  },
                  child :Image.asset(
                    'assets/github.png',
                    height: 40,
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () async {
                      _launchMail();
                    },
                  child: Image.asset(
                    'assets/mail-2.png',
                    height: 40,
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
