import 'package:flutter/material.dart';
import 'package:news_app/screen/NewsCetegory/news_category.dart';
import 'custom_text_tag.dart';

class NewsOfTheDay extends StatefulWidget {
  const NewsOfTheDay({Key? key}) : super(key: key);

  @override
  State<NewsOfTheDay> createState() => _NewsOfTheDayState();
}

class _NewsOfTheDayState extends State<NewsOfTheDay> {
  final String imageUrl =
      'https://www.thesocialhistorian.com/wp-content/uploads/2017/05/The_fin_de_siècle_newspaper_proprietor_cropped-1200x640.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                print('Icon tapped');
                Navigator.pushNamed(context, '/categories');
              },
              icon: const Icon(Icons.category),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTag(
                    backgroundColor: Colors.grey,
                    children: [
                      Text(
                        "News of the day",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Rao IIT Academy institute director held for 'Rs 14 crore GST fraud fggfghfghfgfh fgjffjfh ghhjghj'",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Learn More"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.near_me)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
