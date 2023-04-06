import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import 'package:news_app/widgets/appbar_widgets.dart';

import '../../helper/news_data.dart';
import '../../model/news_model.dart';
import '../../widgets/news_widgets.dart';

class SelectedNewsCategories extends StatefulWidget {
   final String title;
   final String category;
   const SelectedNewsCategories({
    required this.title,
    required this.category,
    Key? key}) : super(key: key);

  @override
  State<SelectedNewsCategories> createState() => _SelectedNewsCategoriesState();
}

class _SelectedNewsCategoriesState extends State<SelectedNewsCategories> {

  List<NewsModel> newsArticle = [];

  Future<void> getNews() async {
    NewsCategories newsData = NewsCategories();
    await newsData.getNews(widget.category);
    setState(() {
      newsArticle = newsData.newsFromRestApiCat;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getNews();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBarWidgets(icon: Icons.backspace, title: widget.title,),
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
