import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_firestore_example/model/styles.dart';
import 'package:todo_app_firestore_example/utils.dart';

class FirebaseApi {
  static Future<String> createStyles(Styles styles) async {
    final docStyles = FirebaseFirestore.instance.collection('styles').doc();

    styles.id = docStyles.id;
    await docStyles.set(styles.toJson());

    return docStyles.id;
  }

  static Stream<List<Styles>> readStyles() => FirebaseFirestore.instance
      .collection('styles')
      .orderBy(StylesField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Styles.fromJson));

  static Future updateStyles(Styles styles) async {
    final docStyles =
        FirebaseFirestore.instance.collection('styles').doc(styles.id);

    await docStyles.update(styles.toJson());
  }

  static Future deleteStyles(Styles styles) async {
    final docStyles =
        FirebaseFirestore.instance.collection('styles').doc(styles.id);

    await docStyles.delete();
  }
}
