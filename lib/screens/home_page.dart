import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdg_fire/screens/add_note_page.dart';
import 'package:gdg_fire/screens/api_page.dart';
import 'package:gdg_fire/widgets/note_card.dart';

CollectionReference notesCollection =
    FirebaseFirestore.instance.collection('notes');

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
        actions: [
          IconButton(
            icon: Icon(Icons.monetization_on),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ApiPage()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: notesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> documents = snapshot.data.documents;
            List<NoteCard> notesCard = [];
            documents
                .map((doc) =>
                    notesCard.add(NoteCard(doc.id, doc.data()["note"])))
                .toList();

            return ListView(
              physics: BouncingScrollPhysics(),
              children: notesCard,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
