import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_mobx/app/controllers/home_controller.dart';
import 'package:lista_mobx/app/models/item_model.dart';
import 'package:lista_mobx/app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  var model = ItemModel();
  _dialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Adicionar item"),
          content: TextField(
            onChanged: model.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Novo item",
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.addItem(model);
                Navigator.pop(context);
              },
              child: Text('Sim'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Não"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Pesquisar..."),
        ),
        actions: [
          TextButton(
            child: Observer(
              builder: (_) {
                return Text(
                  '${controller.totalChecked}',
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.listItems.length,
            itemBuilder: (context, index) {
              var item = controller.listItems[index];
              return ItemWidget(
                item: item,
                removeChecked: () {
                  controller.removeItem(item);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
