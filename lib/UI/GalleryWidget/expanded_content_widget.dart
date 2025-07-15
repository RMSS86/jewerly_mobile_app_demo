import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../Pages/_ARPage.dart';
import '../../Services/AR/AREnv.dart';
import '../../models/ARAsset/ARData/ARAssets.dart';
import '../../models/Gallery/model/CandyPostModel.dart';
import '../../models/Gallery/model/location.dart';


class ExpandedContentWidget extends StatefulWidget {
  final CandyPost location;

  const ExpandedContentWidget({
    required this.location,
  }) ;

  @override
  State<ExpandedContentWidget> createState() => _ExpandedContentWidgetState();
}

class _ExpandedContentWidgetState extends State<ExpandedContentWidget> {

  void GotoARPAge(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: Lottie.asset('assets/UI/AR_Dark.json', width: 110,),
          title: Text('Want to Preview AR Asset?'),
          actions: [
            ElevatedButton(
              onPressed: ()=> Navigator.pop(context),
              child: Text('Not Now', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
            ),

            ElevatedButton(
              onPressed: (){
                Provider.of<ARProvider>(context, listen: false).toggleARModel(ARAssets[0]);
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(
                  builder:
                      (context) => ARPage(),
                ));

              },
              child: Text('Yes, Go AR!',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),

            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inverseSurface,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text(location.addressLine1),
            SizedBox(height: 30),
            // buildAddressRating(location: location),
            // SizedBox(height: 12),
            // buildReview(location: location)
            Image.asset('assets/ecommerce/OptimizedCubeLogo_A.png', width: 110,),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              // Lottie.asset('assets/UI/AR_Dark.json', width: 110,),

              GestureDetector(
                  child: Lottie.asset('assets/UI/AR_Groove.json', width: 110),
              onTap: (){
                GotoARPAge();
              },
              ),
            ],
            ),

          ],
        ),
      );

  Widget buildAddressRating({
    required Location location,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            location.addressLine2,
            style: TextStyle(color: Colors.black45),
          ),
          // StarsWidget(stars: location.starRating, key: null,),
        ],
      );

  Widget buildReview({
    required Location location,
  }) =>
      Row(
        children: location.reviews
            .map((review) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review!.urlImage),
                  ),
                )
        ).toList(),
      );
}
