import 'package:Hush/journal/screen/widget/note_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../models/note_model.dart';
import 'create_new.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 20, 20),
          child: const Text(
            "Your Journal",
            style: TextStyle(
              color: Color(0xFF233C67),
            ),
          ),
        ),
      ),
      body: notes.isEmpty ? buildEmptyState() : buildNoteList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF233C67),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateNote(
              onNewNoteCreated: onNewNoteCreated,
            )),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.black87, // Change the color of the outside circle
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            Ionicons.add,
            color: Colors.white, // Change the color of the icon
            size: 24, // Adjust the size of the icon
          ),
        ),

      ),
    );
  }

  Widget buildEmptyState() {
    return Center(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Color(0xFF233C67),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text(
                "CURRENTLY, THERE'S NOTHING\n\n    CLICK BELOW TO ADD ONE.",
                style: TextStyle(fontSize: 18,
                fontFamily: 'Poppins',
                color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }

  Widget buildNoteList() {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteCard(
          note: notes[index],
          index: index,
          onNoteDeleted: onNoteDeleted,
        );
      },
    );
  }

  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
