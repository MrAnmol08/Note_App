import 'Note.dart';


class Notedata {
  //overall note list
  List<Note> allNotes = [
    Note(id: 0, text: 'First Note')
  ];
    
  //getting notes
  List<Note> getAllNotes(){
    return allNotes;
  }

  //add new note
  void addNewNote(Note note){
    allNotes.add(note);
  }

  // updating note
  void updateNote(Note note, String text)
  {
    //going through all note list
    for (int i = 0; i < allNotes.length; i++){
      //to find the relevant note
      if (allNotes[i].id == note.text) {
        //replace text
        allNotes[i].text = text;
      }
    }
  }

  //deleting note
  void deleteNode(Note note){
    allNotes.remove(note);
  }
}