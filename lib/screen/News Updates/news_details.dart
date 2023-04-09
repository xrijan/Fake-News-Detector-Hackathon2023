import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import 'package:http/http.dart' as http;
import '../../model/news_model.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({required this.newsArticle, required this.index, Key? key})
      : super(key: key);
  final List<NewsModel> newsArticle;
  final int index;
  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  Widget? _icon;
  String domain = ' ';



  Future<void> _fetchIcon() async {
    Uri uri = Uri.parse(widget.newsArticle[widget.index].url);
    String domain = uri.host;
    try {
      final response = await http.get(Uri.parse('https://$domain/favicon.ico'));

      if (response.statusCode == 200) {
        setState(() {
          _icon = Image.network('https://$domain/favicon.ico',height: 18,width: 18,);
        });
      } else {
        throw Exception('Failed to fetch website icon');
      }
    } catch (e) {
      setState(() {
        _icon = null;
      });
      print('Failed to fetch icon: $e');
    }
  }


  @override
  void initState() {
    super.initState();
    _fetchIcon();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.secondaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.backspace,
                      color: Colors.black,
                    )),
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
                      },
                      icon: const Icon(Icons.verified_user_outlined,size: 20,),
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
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
                        // handle liked button press
                      },
                      icon: const Icon(Icons.bookmark_border,size: 20,),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(widget.newsArticle[widget.index].title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                widget.newsArticle[widget.index].publishedAt,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  if (_icon != null) SizedBox(child: _icon!),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Author',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        widget.newsArticle[widget.index].author,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        ///pass link
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),

                          ),
                        ),
                      ),
                      child: const Text(
                        'Visit',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8), // Change the border radius value
                  color: Colors.grey,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.newsArticle[widget.index].urlToImage,
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
               Text( widget.newsArticle[widget.index].description,
                style: const TextStyle(fontSize: 16, letterSpacing: 1),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
