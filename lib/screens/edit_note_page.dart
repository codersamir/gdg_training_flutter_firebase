import 'package:flutter/material.dart';
import 'package:gdg_fire/screens/home_page.dart';

class EditNotePage extends StatefulWidget {
  final String id;
  final String note;

  EditNotePage(this.id, this.note);
  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    noteController = TextEditingController();
    noteController.text = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
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
                notesCollection.doc(widget.id).update({
                  "note": noteController.value.text,
                  "date": DateTime.now(),
                });
                noteController.clear();
                Navigator.pop(context);
              },
              color: Colors.red,
              child: Text(
                "Edit note",
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
