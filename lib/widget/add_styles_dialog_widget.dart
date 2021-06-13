import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_firestore_example/model/styles.dart';
import 'package:todo_app_firestore_example/provider/styles.dart';
import 'package:todo_app_firestore_example/widget/styles_form_widget.dart';

class AddStylesDialogWidget extends StatefulWidget {
  @override
  _AddStylesDialogWidgetState createState() => _AddStylesDialogWidgetState();
}

class _AddStylesDialogWidgetState extends State<AddStylesDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Dancing Styles',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              StylesFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedStyles: addStyles,
              ),
            ],
          ),
        ),
      );

  void addStyles() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Styles(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addStyles(todo);

      Navigator.of(context).pop();
    }
  }
}
