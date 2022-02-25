class NewsModel {
  dynamic title;
  dynamic description;
  dynamic link;
  dynamic enclosure;
  dynamic guid;
  dynamic pubDate;

  NewsModel({
    this.title,
    this.description,
    this.link,
    this.enclosure,
    this.guid,
    this.pubDate
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      link: json['link'],
      enclosure: json['enclosure'],
      guid: json['guid'],
      pubDate: json['pubDate']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'link': link,
      'enclosure': enclosure,
      'guid': guid,
      'pubDate': pubDate,
    };
  }

}

