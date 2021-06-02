import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:lista_mobx/app/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final Function removeChecked;

  const ItemWidget({this.item, this.removeChecked});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
            title: Text(item.title),
            leading: Checkbox(
              onChanged: item.setCheck,
              value: item.check,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete_sharp),
              color: Colors.red,
              onPressed: removeChecked,
            ));
      },
    );
  }
}
