import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import 'package:news_app/helper/news_data.dart';
import 'package:news_app/screen/News%20Updates/news_details.dart';
import 'package:share_plus/share_plus.dart';
import '../../helper/database.dart';
import '../../model/news_model.dart';
import '../../widgets/news_of_day.dart';
import '../NewsCetegory/news_category.dart';
import '../NewsSearch/search.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  //database
  DBHelper dbHelper = DBHelper();

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
    startLoadingTimer();
  }

  bool _isLoading = true;

  void startLoadingTimer() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  bool hasData = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SingleChildScrollView(
        child: _isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset('assets/ground.png'),
                    ),
                    // leading: Padding(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   child: GestureDetector(
                    //     onTap: (){
                    //       Navigator.pushNamed(context, '/userProfile');
                    //     },
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           color: Colors.black54,
                    //           width: 2,
                    //         ),
                    //       ),
                    //       child: const CircleAvatar(
                    //         backgroundImage: NetworkImage(
                    //           'https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg',
                    //         ),
                    //         backgroundColor: Colors.grey,
                    //         radius: 40, // change the radius to 20
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    actions: [
                      Container(
                        width: 40,
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
                            showSearch(
                                context: context,
                                delegate: CustomSearchDelegate());
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg',
                            ),
                            backgroundColor: Colors.grey,
                            radius: 14, // change the radius to 20
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Trending Stories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const NewsOfTheDay(),
                  const Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Explore",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const NewsCategoryScreen(),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today Highlights",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/highlights');
                          },
                          child: const Text(
                            'Show More',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(newsArticle.length, (index) {
                      return newsArticle.isEmpty
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetails(
                                          newsArticle: newsArticle,
                                          index: index)),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                8), // Change the border radius value
                                            color: CustomColor.secondaryColor,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  newsArticle[index]
                                                      .urlToImage),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              newsArticle[index].author.isEmpty
                                                  ? const Text('News Api',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey))
                                                  : Text(
                                                      newsArticle[index].author,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey)),
                                              Text(newsArticle[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      newsArticle[index]
                                                          .publishedAt,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey)),
                                                  IconButton(
                                                    icon:
                                                        const Icon(Icons.share),
                                                    onPressed: () {
                                                      Share.share(
                                                          newsArticle[index]
                                                              .url);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            );
                    }),
                  ),
                ],
              ),
      ),
    );
  }
}
