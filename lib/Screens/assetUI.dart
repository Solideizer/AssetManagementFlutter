import 'package:flutter/material.dart';
import 'package:flutter_asset/addAssetDialog.dart';
import 'package:flutter_asset/asset.dart';
import 'package:flutter_asset/assetListWidget.dart';
import 'package:flutter_asset/assets.dart';
import 'package:provider/provider.dart';

import '../completedListWidget.dart';
import '../firebaseApi.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      AssetListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text("Asset Management"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "Eklenen Assetler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline, size: 28.0),
            label: "Zimmetlenen Assetler",
          ),
        ],
      ),
      body: StreamBuilder<List<Asset>>(
        stream: FirebaseApi.readAsset(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              final assets = snapshot.data;
              final provider = Provider.of<AssetsProvider>(context);
              provider.setAssets(assets);
              return tabs[selectedIndex];
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          //child: AddAssetDialogWidget(),
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AddAssetDialogWidget();
          },
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
