import 'package:json_annotation/json_annotation.dart';
part 'response_top_headlines_news.g.dart';

@JsonSerializable()
class ResponseHaberBasliklari {
  String status;
  int totalResults;
  List<Article> articles;
  @JsonKey(ignore: true)
  String error;

  ResponseHaberBasliklari(this.status,this.totalResults,this.articles);

  ResponseHaberBasliklari.withError(this.error);

  factory ResponseHaberBasliklari.fromJson(Map<String, dynamic> json) => _$ResponseTopHeadlinesNewsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseTopHeadlinesNewsToJson(this);

  @override
  String toString() {
    return 'ResponseHaberBasliklari{Durum: $status,toplamSonuç: $totalResults,Makale: $articles}';
  }
}

@JsonSerializable()
class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  String toString() {
    return 'Article{source: $source,author: $author,title: $title,description: $description,url: $url,urlToImage: $urlToImage,publishedAt: $publishedAt,content: $content}';
  }
}

@JsonSerializable()
class Source{
  String name;

  Source(this.name);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  @override
  String toString() {
    return 'Source{name: $name}';
  }
  

}

