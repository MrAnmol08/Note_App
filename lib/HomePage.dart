import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:noteapp/models/data.dart';
import 'package:noteapp/pages/Edit_NotePage.dart';
import 'package:provider/provider.dart';

import 'models/Note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating new note
  void createNewNote() {
    //creating the new id
    int id = Provider.of<Notedata>(context, listen: false).getAllNotes().length;
    
    //
    Note newNote = Note(
      id: id,
      text: '',
    );

    //Go to Edit the note
    goToNotePage(newNote, true);
  }

  //Go to note editing
  void goToNotePage(Note note, bool isNewNote){
    Navigator.push(
      context,
     MaterialPageRoute(
      builder: (context) => EditingNotePage(
        note: note,
        isNewNote: false,
      ),
      ),
      );
  }

  //Delete the note
  void deleteNote(Note note){
    Provider.of<Notedata>(context, listen: false).deleteNode(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Notedata>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: createNewNote,
        //   child: Icon(Ionicons.add),
        // ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text(
              'Notes',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: true, // Center the title within the AppBar
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Ionicons.ellipsis_horizontal_circle_outline,
                  size: 30, // Replace this with the Ionicon you want to use
                  color: Color.fromARGB(255, 238, 204, 104),
                  // Change the color of the icon as needed
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 25),
              child: Text(
                'Notes',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // List of Notes
            CupertinoListSection.insetGrouped(
              children: List.generate(
                value.getAllNotes().length,
                (index) => CupertinoListTile(
                  title: Text(value.getAllNotes()[index].text),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white, // Set the background color to match the app bar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  createNewNote();
                },
                icon: Icon(
                  Ionicons.add_circle_outline, // Replace this with your desired additional icon
                  size: 32.0, // Adjust the size of the additional icon
                  color: const Color.fromARGB(255, 238, 204, 104), // Change the color of the additional icon
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
