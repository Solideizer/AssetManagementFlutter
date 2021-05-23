import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_asset/asset.dart';
import 'package:flutter_asset/assetFormWidget.dart';
import 'package:flutter_asset/assets.dart';
import 'package:provider/provider.dart';

class AddAssetDialogWidget extends StatefulWidget {
  @override
  _AddAssetDialogWidgetState createState() => _AddAssetDialogWidgetState();
}

class _AddAssetDialogWidgetState extends State<AddAssetDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String givingDate;
  String receivingDate;
  String receiverName = '';
  String assetType = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Asset',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 8,
              ),
              AssetFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onChangedGivingDate: (givingDate) =>
                    setState(() => this.givingDate = givingDate.toString()),
                onChangedReceivingDate: (receivingDate) => setState(
                    () => this.receivingDate = receivingDate.toString()),
                onChangedAssetType: (assetType) =>
                    setState(() => this.assetType = assetType),
                onChangedReceiverName: (receiverName) =>
                    setState(() => this.receiverName = receiverName),
                onSavedAsset: addAsset,
              )
            ],
          ),
        ),
      );

  void addAsset() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final asset = Asset(
        createdTime: DateTime.now(),
        title: title,
        description: description,
        givingDate: givingDate,
        receivingDate: receivingDate,
        receiverName: receiverName,
        assetType: assetType,
        id: DateTime.now().toString(),
      );

      final provider = Provider.of<AssetsProvider>(context, listen: false);
      provider.addAsset(asset);

      Navigator.of(context).pop();
    }
  }
}
