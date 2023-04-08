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

  bool hasData = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg',
              ),
              backgroundColor: Colors.grey,
              radius: 20, // change the radius to 20
            ),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColor.secondaryColor,
              border: Border.all(
                color: Colors.grey.shade50,
                width: 2,
              ),
            ),
            child: IconButton(
              onPressed: () {
                // handle search button press
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.secondaryColor,
                border: Border.all(
                  color: Colors.grey.shade50,
                  width: 2,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  // handle liked button press
                },
                icon:Stack(
                  children: [
                    const Icon(Icons.favorite_border),
                    if (hasData)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
                color: Colors.black,
              ),
            ),
          ),
        ],

      ),
      backgroundColor: CustomColor.primaryColor,
      bottomNavigationBar: const CustomNavBar(index: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
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
