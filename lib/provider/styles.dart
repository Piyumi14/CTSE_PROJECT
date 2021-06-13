import 'package:flutter/cupertino.dart';
import 'package:todo_app_firestore_example/api/firebase_api.dart';
import 'package:todo_app_firestore_example/model/styles.dart';

class TodosProvider extends ChangeNotifier {
  List<Styles> _styles = [];

  List<Styles> get todos =>
      _styles.where((styles) => styles.isDone == false).toList();

  List<Styles> get todosCompleted =>
      _styles.where((styles) => styles.isDone == true).toList();

  void setTodos(List<Styles> styles) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _styles = styles;
        notifyListeners();
      });

  void addStyles(Styles styles) => FirebaseApi.createStyles(styles);

  void removeStyles(Styles styles) => FirebaseApi.deleteStyles(styles);

  bool toggleStylesStatus(Styles styles) {
    styles.isDone = !styles.isDone;
    FirebaseApi.updateStyles(styles);

    return styles.isDone;
  }

  void updateStyles(Styles styles, String title, String description) {
    styles.title = title;
    styles.description = description;

    FirebaseApi.updateStyles(styles);
  }
}
