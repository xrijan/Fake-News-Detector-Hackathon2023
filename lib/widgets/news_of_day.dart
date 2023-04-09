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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
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
                    const Text(
                      "Rao IIT Academy institute director held for 'Rs 14 crore GST fraud fggfghfghfgfh fgjffjfh ghhjghj'",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        const CustomTag(
                          backgroundColor: Colors.transparent,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text("🔥"),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Trending No.1",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(onPressed: () {

                        }, child: const Text("Learn More",style: TextStyle(color: Colors.grey),))
                      ],
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
