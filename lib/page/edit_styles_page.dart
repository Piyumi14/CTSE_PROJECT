import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_firestore_example/model/styles.dart';
import 'package:todo_app_firestore_example/provider/styles.dart';
import 'package:todo_app_firestore_example/widget/styles_form_widget.dart';

class EditStylesPage extends StatefulWidget {
  final Styles styles;

  const EditStylesPage({Key key, @required this.styles}) : super(key: key);

  @override
  _EditStylesPageState createState() => _EditStylesPageState();
}

class _EditStylesPageState extends State<EditStylesPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String description;

  @override
  void initState() {
    super.initState();

    title = widget.styles.title;
    description = widget.styles.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Dancing Styles'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeStyles(widget.styles);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: StylesFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedStyles: saveStyles,
            ),
          ),
        ),
      );

  void saveStyles() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateStyles(widget.styles, title, description);

      Navigator.of(context).pop();
    }
  }
}
