
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/News%20Updates/news_details.dart';
import 'package:share_plus/share_plus.dart';

import '../colors.dart';
import '../model/news_model.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
    required this.newsArticle,
    required this.index,
  });

  final List<NewsModel> newsArticle;
  final int index;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetails(newsArticle: widget.newsArticle, index: widget.index)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.newsArticle[widget.index].urlToImage,
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),

            ///tittle
            Text(
              widget.newsArticle[widget.index].title,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///publisher
                Text(
                  widget.newsArticle[widget.index].publishedAt,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                    onPressed: () {
                      Share.share(widget.newsArticle[widget.index].url);
                    }, icon: const Icon(Icons.share)),
                // IconButton(
                //     onPressed: () {
                //
                //     },
                //     icon: const Icon(Icons.verified_user_rounded)),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}