import 'package:flutter/material.dart';
import '../../models/Gallery/model/CandyPostModel.dart';
import '../../models/Gallery/model/location.dart';


class ImageWidget extends StatelessWidget {
  final CandyPost candy_;

  const ImageWidget({
    required this.candy_,
     // Key? key,
  }) ; //: super(key: key)

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      /// space from white container
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  Icon(Icons.drag_indicator),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(candy_.IGTag, fit: BoxFit.cover),
        ),
      );

  Widget buildTopText() =>
      Image.asset('assets/ecommerce/OptimizedCubeLogo_A.png', width: 60,);
// Image.network('https://www.instagram.com/p/C5tmQ7dx0C5/media/?size=l', width: 80,);

}
