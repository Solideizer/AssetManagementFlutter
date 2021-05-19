import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets.dart';
import '../assetFormWidget.dart';

class EditAssetPage extends StatefulWidget {
  final asset;
  const EditAssetPage({Key key, @required this.asset}) : super(key: key);

  @override
  _EditAssetPageState createState() => _EditAssetPageState();
}

class _EditAssetPageState extends State<EditAssetPage> {
  String title;
  String description;
  DateTime givingDate;
  DateTime receivingDate;
  String receiverID;
  String assetType;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title = widget.asset.title;
    description = widget.asset.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Asset'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: AssetFormWidget(
              title: title,
              description: description,
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedGivingDate: (givingDate) =>
                  setState(() => this.givingDate = givingDate),
              onChangedReceivingDate: (receivingDate) =>
                  setState(() => this.receivingDate = receivingDate),
              onChangedAssetType: (assetType) =>
                  setState(() => this.assetType = assetType),
              onChangedReceiverID: (receiverID) =>
                  setState(() => this.receiverID = receiverID),
              onSavedAsset: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<AssetsProvider>(context, listen: false);
      provider.updateAsset(widget.asset, title, description);

      Navigator.of(context).pop();
    }
  }
}
