class ArticlesResponseModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;
  ArticlesResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  // Serialization (Convert Map to Object)
  factory ArticlesResponseModel.fromMap(Map<String, dynamic> map) {
    return ArticlesResponseModel(
      status: map['status'],
      totalResults: map['totalResults'],
      articles: (map['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromMap(e))
          .toList(),
    );
  }
}

class ArticleModel {
  final String? author;
  final String title;
  final String? description;
  final String? content;
  final String? image;
  final String publishedAt;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.publishedAt,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> map) => ArticleModel(
    author: map['author'],
    title: map['title'],
    description: map['description'],
    content: map['content'],
    image: map['urlToImage'],
    publishedAt: map['publishedAt'],
  );
}