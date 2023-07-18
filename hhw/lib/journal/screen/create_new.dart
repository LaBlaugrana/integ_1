import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../models/note_model.dart';
// import 'package:flutter_notes/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 20, 20),
          child: const Text('New Journal',
          style: TextStyle(
            color: Color(0xFF233C67)
          ),),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF233C67),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: titleController,
                    style: const TextStyle(
                      color: Colors.white,
                        fontSize: 28
                    ),
                    decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                      hintStyle: TextStyle(
                        color: Colors.grey[350]
                      )
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF233C67),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 140, // Adjust the height according to your requirements
                    child: TextFormField(
                      controller: bodyController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your thoughts...",
                        hintStyle: TextStyle(
                          color: Colors.grey[350],
                        ),
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                    ),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          if(titleController.text.isEmpty){
            return;
          }
          if(bodyController.text.isEmpty){
            return;
          }

          final note = Note(
            body: bodyController.text,
            title: titleController.text,
          );

          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Change the color of the outside circle
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            Ionicons.save,
            color: Color(0xFF233C67), // Change the color of the icon
            size: 24, // Adjust the size of the icon
          ),
        ),

      ),
    );
  }
}