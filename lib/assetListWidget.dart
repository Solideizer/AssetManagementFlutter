import 'package:flutter/material.dart';
import 'package:flutter_asset/assetWidget.dart';
import 'package:provider/provider.dart';
import 'assets.dart';

class AssetListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssetsProvider>(context);
    final assets = provider.assets;

    return assets.isEmpty
        ? Center(
            child: Text(
              'Henüz asset kaydı yapmadınız',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: assets.length,
            itemBuilder: (context, index) {
              final asset = assets[index];

              return AssetWidget(asset: asset);
            },
          );
  }
}
