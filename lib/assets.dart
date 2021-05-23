import 'package:flutter/material.dart';
import 'package:flutter_asset/asset.dart';

import 'firebaseApi.dart';

class AssetsProvider extends ChangeNotifier {
  List<Asset> _assets = [];

  List<Asset> get assets =>
      _assets.where((asset) => asset.isAssigned == false).toList();
  List<Asset> get assignedAssets =>
      _assets.where((asset) => asset.isAssigned == true).toList();

  void setAssets(List<Asset> assets) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _assets = assets;
      notifyListeners();
    });
  }

  void addAsset(Asset asset) {
    FirebaseApi.createAsset(asset);
  }

  void removeAsset(Asset asset) {
    _assets.remove(asset);
    notifyListeners();
  }

  bool toggleAssetStatus(Asset asset) {
    asset.isAssigned = !asset.isAssigned;
    FirebaseApi.updateAsset(asset);

    return asset.isAssigned;
  }

  void updateAsset(
      Asset asset,
      String title,
      String description,
      DateTime givingDate,
      DateTime receivingDate,
      String assetType,
      String receiverName) {
    asset.title = title;
    asset.description = description;
    asset.givingDate = givingDate.toString();
    asset.receivingDate = receivingDate.toString();
    asset.receiverName = receiverName;
    asset.assetType = assetType;

    FirebaseApi.updateAsset(asset);
  }
}
