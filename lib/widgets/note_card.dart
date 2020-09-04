import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdg_fire/screens/edit_note_page.dart';

CollectionReference notesCollection =
    FirebaseFirestore.instance.collection('notes');

class NoteCard extends StatelessWidget {
  final String id;
  final String note;

  NoteCard(this.id, this.note);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNotePage(id, note)));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outline),
              color: Colors.red,
              onPressed: () {
                notesCollection.doc(id).delete();
              },
            )
          ],
        ),
      ),
    );
  }
}
