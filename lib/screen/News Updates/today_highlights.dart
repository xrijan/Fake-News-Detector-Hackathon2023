import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import '../../helper/news_data.dart';
import '../../model/news_model.dart';
import '../../widgets/appbar_widgets.dart';
import '../../widgets/news_widgets.dart';

class MoreTodayHighlights extends StatefulWidget {
  const MoreTodayHighlights({Key? key}) : super(key: key);

  @override
  State<MoreTodayHighlights> createState() => _MoreTodayHighlightsState();
}

class _MoreTodayHighlightsState extends State<MoreTodayHighlights> {
  //get the list of the news
  List<NewsModel> newsArticle = [];

  Future<void> getNews() async {
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
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBarWidgets(
        icon: Icons.backspace,
        title: 'Today Highlights',
      ),
      body: newsArticle.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            )
          : RefreshIndicator(
              color: Colors.black,
              onRefresh: () => getNews(),
              child: ListView.builder(
                  itemCount: newsArticle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NewWidget(newsArticle: newsArticle, index: index);
                  }),
            ),
    );
  }
}
