import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference notesCollection =
    FirebaseFirestore.instance.collection('notes');

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    noteController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: noteController,
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Enter you note here",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            RaisedButton(
              onPressed: () {
                notesCollection.add({
                  "note": noteController.value.text,
                  "date": DateTime.now(),
                });
                noteController.clear();
                Navigator.pop(context);
              },
              color: Colors.red,
              child: Text(
                "Add note",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
