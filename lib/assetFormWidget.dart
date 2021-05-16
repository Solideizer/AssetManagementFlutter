import 'package:flutter/material.dart';

class AssetFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final DateTime givingDate;
  final DateTime receivingDate;
  final int receiverID;
  final String assetType;
  final assetTypeList = ["Fiziksel", "Dijital", "İnsan Kaynağı"];
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<DateTime> onChangedGivingDate;
  final ValueChanged<DateTime> onChangedReceivingDate;
  final ValueChanged<String> onChangedReceiverID;
  final ValueChanged<String> onChangedAssetType;
  final VoidCallback onSavedAsset;

  AssetFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    this.givingDate,
    this.receivingDate,
    this.receiverID = 0,
    this.assetType = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    this.onChangedGivingDate,
    this.onChangedReceivingDate,
    this.onChangedReceiverID,
    this.onChangedAssetType,
    @required this.onSavedAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            Container(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width,
            ),
            buildDescription(),
            Container(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width,
            ),
            buildReceiverID(),
            Container(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width,
            ),
            buildAssetType(),
            Container(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width,
            ),
            buildGivingDate(context),
            buildReceivingDate(context),
            Container(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width,
            ),
            buildButton(),
          ],
        ),
      );

  buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'Başlık boş bırakılamaz';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Başlık',
        ),
      );

  buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Açıklama',
        ),
      );

  Widget buildGivingDate(BuildContext context) => Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () => pickGivingDate(context),
          child: Text(
            'Verilme tarihi seçiniz',
            style: TextStyle(
              color: Colors.amber[400],
            ),
          ),
        ),
      );

  Widget buildReceivingDate(BuildContext context) => Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () => pickReceivingDate(context),
          child: Text(
            'Geri alınacak tarihi seçiniz',
            style: TextStyle(
              color: Colors.amber[400],
            ),
          ),
        ),
      );

  Future pickReceivingDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;

    onChangedReceivingDate(newDate);
  }

  Future pickGivingDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;

    onChangedGivingDate(newDate);
  }

  buildReceiverID() => TextFormField(
        maxLines: 3,
        initialValue: receiverID.toString(),
        onChanged: onChangedReceiverID,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Verilen Kişi',
        ),
      );

  buildAssetType() => DropdownButton(
        hint: Text("Asset tipini seçiniz"),
        items: assetTypeList.map((dropDownItem) {
          return DropdownMenuItem<String>(
              value: dropDownItem, child: Text(dropDownItem));
        }).toList(),
        //value: assetType,
        onChanged: onChangedAssetType,
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: onSavedAsset,
          child: Text(
            'Kaydet',
            style: TextStyle(
              color: Colors.amber[400],
            ),
          ),
        ),
      );
}
