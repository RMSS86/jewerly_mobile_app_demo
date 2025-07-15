import 'package:jadecandyv1/models/Gallery/model/CandyPostModel.dart';

class CandyLineCategory{
  final String categoryName;
  final String categoryLogo;
  final String releaseDate;

  final List<CandyPost> models_;


  CandyLineCategory({
    required this.categoryName,
    required this.categoryLogo,
    required this.releaseDate,
    required this.models_,

});
}