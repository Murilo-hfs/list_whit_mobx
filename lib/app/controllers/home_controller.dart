import 'package:lista_mobx/app/models/item_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  ObservableList<ItemModel> listItems = [
    ItemModel(
      title: 'Item 1',
      check: true,
    ),
    ItemModel(
      title: 'Item 2',
      check: false,
    ),
    ItemModel(
      title: 'Item 3',
      check: false,
    ),
  ].asObservable();

  @computed
  int get totalChecked => listItems.where((item) => item.check).length;

  @action
  addItem(ItemModel model){
    listItems.add(model);
  }

  @action
  removeItem(ItemModel model){
    listItems.removeWhere((item) => item.title == model.title);
  }

  
}