import 'package:cloud_firestore/cloud_firestore.dart';
import 'Utils.dart';
import 'asset.dart';

class FirebaseApi {
  static Future<String> createAsset(Asset asset) async {
    final docAsset = FirebaseFirestore.instance.collection('asset').doc();

    asset.id = docAsset.id;
    await docAsset.set(asset.toJson());

    return docAsset.id;
  }

  static Stream<List<Asset>> readAsset() => FirebaseFirestore.instance
      .collection('asset')
      .orderBy(AssetField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Asset.fromJson));

  static Future updateAsset(Asset asset) async {
    final docAsset =
        FirebaseFirestore.instance.collection('asset').doc(asset.id);
    await docAsset.update(asset.toJson());
  }

  static Future deleteAsset(Asset asset) async {
    final docAsset =
        FirebaseFirestore.instance.collection('asset').doc(asset.id);
    await docAsset.delete();
  }
}
