class CandyPost {
  final String name;
  final String urlImage;

  final String url;
  final bool isWeb;
  final String localName;
  final bool isAvailable;

  final String collection;
  final DateTime releaseDate; //DateTime.utc(Y,M,D);
  final String model;

  final String webUrl;
  final String previewUrl;
  final String previewName;
  final int index_;
  final String description;
  final String IGTag;

  CandyPost({
    required this.name,
    required this.urlImage,

    required this.url,
    required this.isWeb,
    required this.localName,
    required this.isAvailable,

    required this.collection,
    required this.releaseDate,
    required this.model,

    required this.webUrl,
    required this.previewUrl,
    required this.previewName,
    required this.index_,
    required this.description,
    required this.IGTag,
  });
}

