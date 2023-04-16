import 'package:flutter/material.dart';
import 'package:news_app/helper/news_data.dart';
import '../model/news_model.dart';
import '../screen/News Updates/news_details.dart';
import 'custom_text_tag.dart';

class NewsOfTheDay extends StatefulWidget {
  const NewsOfTheDay({Key? key}) : super(key: key);

  @override
  State<NewsOfTheDay> createState() => _NewsOfTheDayState();
}

class _NewsOfTheDayState extends State<NewsOfTheDay> {
  int index = 0;
  List<NewsModel> newsArticle = [];
  getNews() async {
    TopHeadlineBBC topHeadlineBBC = TopHeadlineBBC();
    await topHeadlineBBC.getNews();
    setState(() {
      newsArticle = topHeadlineBBC.newsFromRestApiBBC;
    });
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
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
            image: NetworkImage(newsArticle[index].urlToImage),
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
                   Text(
                      newsArticle[index].title,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetails(newsArticle: newsArticle, index: index)),
                          );
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
