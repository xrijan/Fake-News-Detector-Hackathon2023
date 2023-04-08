import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



//flask api text
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String greetings = "";
  final firstController = TextEditingController();
  final lastController = TextEditingController();

  String firstName = " ";
  String lastName = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.secondaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: firstController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "First Name")),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: lastController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Last Name")),
            ),
            Text(greetings),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        firstName = firstController.text;
                        lastName = lastController.text;
                      });

                      const url = 'http://127.0.0.1:5000/user';
                      //post methord
                      final postResponse = await http.post(Uri.parse(url),
                          body: json.encode({
                            'firstName': firstName,
                            'lastName' : lastName,

                          }));

                      final getResponse = await http.get(Uri.parse(url));
                      final decode =
                      json.decode(getResponse.body) as Map<String, dynamic>;
                      setState(() {
                        greetings = decode["greetings"];
                      });
                    },
                    child: const Text("Sum"))),
          ],
        ));
  }
}
