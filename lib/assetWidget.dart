import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_asset/assets.dart';
import 'package:provider/provider.dart';

import 'editAssetPage.dart';
import 'asset.dart';

class AssetWidget extends StatelessWidget {
  final Asset asset;

  const AssetWidget({
    @required this.asset,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          child: buildAsset(context),
          actionPane: SlidableDrawerActionPane(),
          key: Key(asset.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editAsset(context, asset),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              onTap: () => deleteAsset(context, asset),
              caption: 'Delete',
              icon: Icons.delete,
            )
          ],
        ),
      );

  Widget buildAsset(BuildContext context) => Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Colors.black,
              checkColor: Theme.of(context).accentColor,
              value: asset.isAssigned,
              onChanged: (_) {
                final provider =
                    Provider.of<AssetsProvider>(context, listen: false);
                final isDone = provider.toggleAssetStatus(asset);
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  if (asset.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        asset.description,
                        style: TextStyle(
                            fontSize: 20, height: 1.5, color: Colors.black87),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Asset tipi: ',
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      asset.assetType,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Verilme tarihi: ',
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      asset.givingDate,
                      style: TextStyle(
                          fontSize: 20, height: 1.5, color: Colors.black87),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Geri alınacak tarih: ',
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      asset.receivingDate,
                      style: TextStyle(
                          fontSize: 20, height: 1.5, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  deleteAsset(BuildContext context, Asset asset) {
    final provider = Provider.of<AssetsProvider>(context, listen: false);
    provider.removeAsset(asset);
  }

  editAsset(BuildContext context, Asset asset) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditAssetPage(asset: asset),
        ),
      );
}
