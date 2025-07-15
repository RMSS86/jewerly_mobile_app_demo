
import 'package:flutter/cupertino.dart';
import '../../models/ARAsset/ARAssetModel.dart';
import '../../models/ARAsset/ARData/ARAssets.dart';

class ARProvider extends ChangeNotifier
{
    ARAsset _globalARAsset = ARAssets[0];
    ARAsset _globalARAsset3D = ARAssets[2];

    ARAsset get globalARAsset_ => _globalARAsset;
    ARAsset get globalARAsset3D_ => _globalARAsset3D;

    set globalARAsset_(ARAsset asset_) 
    {
        _globalARAsset = asset_;
        notifyListeners();
    }

    set globalARAsset3D_(ARAsset asset_) 
    {
        _globalARAsset3D = asset_;
        notifyListeners();
    }

    void toggleARModel(ARAsset asset) 
    {
        globalARAsset_ = asset;
    }
    void toggle3DARModel(ARAsset asset) 
    {
        _globalARAsset3D = asset;
    }
    void assetRouter() 
    {

    }
}

//TODO: create the envArarAseet model inside the provider
//TODO:
