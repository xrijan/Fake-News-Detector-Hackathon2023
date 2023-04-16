class NewsModel {
  String author = '';
  String title = '';
  String description = '';
  String url = '';
  String urlToImage = '';
  String publishedAt = '';

  NewsModel(
      {
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
      });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }
}
