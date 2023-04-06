import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import 'package:news_app/helper/news_data.dart';
import '../../model/news_model.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/news_of_day.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final String imageUrl =
      'https://www.thesocialhistorian.com/wp-content/uploads/2016/01/Duke_Humfreys_Library_Interior_6_Bodleian_Library_Oxford_UK_-_Diliff-2048x1523.jpg';

  //get the list of the news
  List<NewsModel> newsArticle = [];

  getNews() async {
    NewsData newsData = NewsData();
    await newsData.getNews();
    setState(() {
      newsArticle = newsData.newsFromRestApi;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (kDebugMode) {
              print('Icon tapped');
            }
            Navigator.pushNamed(context, '/categories');
          },
          icon: const Icon(Icons.category),
        ),
      ),
      backgroundColor: CustomColor.primaryColor,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomNavBar(index: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const NewsOfTheDay(),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today Highlights",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/highlights');
                  },
                  child: const Text('Show More'),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
               padding: EdgeInsets.zero,
                itemCount: newsArticle.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(newsArticle[index].urlToImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                const Icon(Icons.person),
                                Text(
                                  newsArticle[index].author.length.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(newsArticle[index].title),
                             Text(
                              newsArticle[index].publishedAt,
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
