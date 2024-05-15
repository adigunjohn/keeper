import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/model/locator.dart';
import 'package:keeper/model/navigation_service.dart';
import 'package:keeper/ui/data/note.dart';
//import 'package:provider/provider.dart';

final NoteModel = ChangeNotifierProvider((ref) => NoteProvider());

class NoteProvider extends ChangeNotifier {
  /// for pinned notes
  List<Note> _pinnedNotes = [
   // Note(title: 'one one one',color: Colors.orange,noteFoldersTag: 'idea'),
    // Note(title: 'one one one',color: Colors.orange,noteFoldersTag: 'idea'),
  ];
  List<Note> get pinnedNotes => _pinnedNotes;
  Set<int> pinNotes = {};

  bool get pinnedNL{
    return pinnedNotes.length >= 1 ? true : false;
  }

  ///for ideas notes
  List<Note> _ideasNoteList = [];
  // List<Note> get _ideasNoteList{
  //   return [
  //     Note(title: 'one one one',color: Colors.red,noteFoldersTag: 'idea', noteId: 1),
  //     // Note(title: 'two two two', color: Colors.green,noteFoldersTag: 'idea'),
  //     // Note(title: 'three three three',color: Colors.purple,noteFoldersTag: 'idea'),
  //   ];
  // } v
  List<Note> get ideaNL => _ideasNoteList;

  ///for todonotes
  // List<Note> _toDoNoteList = [
  //   Note(title: 'one one one',noteFoldersTag: '${todoFol.folderTitle}'),
  //   Note(title: 'two two two',),
  //   Note(title: 'three three three',),
  // ];
  // List<Note> get _toDoNoteListt{
  //   return [
  //     Note(title: 'ttttone one one',color: Colors.orange,noteFoldersTag: 'todo',noteId: 1),
  //     Note(title: 'tttttwo two two', color: Colors.green,noteFoldersTag: 'todo', noteId: 2),
  //     Note(title: 'tttttthree three three',color: Colors.purple,noteFoldersTag: 'todo', noteId: 3),
  //   ];
  // }
  List<Note> _toDoNoteListt = [];
  List<Note> get todoNL => _toDoNoteListt;

  ///for random notes
  // List<Note> get _randomNoteList{
  //   return [
  //     Note(title: 'raone raone raone',color: Colors.pink,noteFoldersTag: 'random',noteId: 1),
  //     Note(title: 'raone2222 raone raone',color: Colors.indigo,noteFoldersTag: 'random',noteId: 2),
  //     Note(title: 'raone 33333raone raone',color: Colors.blueGrey,noteFoldersTag: 'random',noteId: 3),
  //     Note(title: 'raone4444 raone raone',color: Colors.amber,noteFoldersTag: 'random',noteId: 4),
  //     Note(title: 'raone5555 raone raone',color: Colors.orange,noteFoldersTag: 'random',noteId: 5),
  //     // Note(title: 'two two two', color: Colors.green,noteFoldersTag: 'idea'),
  //     // Note(title: 'three three three',color: Colors.purple,noteFoldersTag: 'idea'),
  //   ];
  // }
  List<Note> _randomNoteList = [];
  List<Note> get randomNL => _randomNoteList;

  ///for WriteUps notes
  // List<Note> get _writeUpsNoteList{
  //   return [
  //    // Note(title: 'Writeone Writeone Writeone',color: Colors.orange,noteFoldersTag: 'idea', noteId: 1),
  //     // Note(title: 'two two two', color: Colors.green,noteFoldersTag: 'idea'),
  //     // Note(title: 'three three three',color: Colors.purple,noteFoldersTag: 'idea'),
  //   ];
  // }
  List<Note> _writeUpsNoteList= [];
  List<Note> get writeUpsNL => _writeUpsNoteList;

  ///for all notes
  List<Note> _allNote = [];
    // return [..._ideasNoteList, ..._toDoNoteListt, ..._writeUpsNoteList, ..._randomNoteList, ..._addNewNotes];
  //}
  // //adding new notes from new folders to the all tab
  // List<Note> _addNewNotes= [];

  List<Note> get allNL => _allNote;

 int noteID = 0;
 // void note(){
 //   noteID++;
 //   notifyListeners();
 // }

   void addNote(List<Note> list, Note newNote){
     if(titleController.text.isNotEmpty && contentController.text.isNotEmpty){
       noteID++;
       list.add(newNote);
       _allNote.add(newNote);
       print('new note added');
       notifyListeners();
       titleController.clear();
       contentController.clear();
       locator<NavigationService>().pop();
       print(newNote);
       print(list.length);
       print(newNote.title);
       print(newNote.content);
       print(newNote.color);
     }
     else{print('tiltle and content of new note cannot be empty');}
   }

  void editNote(Note newNote, Note oldNote, List<Note> list,){
    final index = list.indexOf(oldNote);
    final idx = list.where((e) => e == oldNote);
    print(index);
    print(idx);
    // list[index] = newNote;
    notifyListeners();
  }

  void pinNote(Note note){
     if(!pinNotes.contains(note.noteId)){
       pinNotes.add(note.noteId);
       _pinnedNotes.add(note);
       print('new note pinned');
       print(note.noteId);
       notifyListeners();
     }
     else{ print('note is already pinned');}

  }
  void unpinNote(Note note){
    if(pinNotes.contains(note.noteId)){
      pinNotes.remove(note.noteId);
      _pinnedNotes.remove(note);
      print('new note unpinned');
      //print(note.noteId);
      notifyListeners();
    }
    else{ print('note is already pinned');}

  }
  ///folder list stuffs
  // List<List<Note>> get _folderList {
  //   return [_toDoNoteList, _ideasNoteList];
  // }

  List<NoteFolders> get folderListt {
    return [ideaFol,todoFol,randomFol,writeUpFol, ...somethingNew];
  }

  List<NoteFolders> get folderList {
    return [allNoteFol,ideaFol,todoFol,randomFol,writeUpFol, ...somethingNew];
  }
  List<NoteFolders> somethingNew = [];
  // List<NoteFolders> folderListter = [
  //   // ideaFol,todoFol,randomFol,writeUpFol,
  // ];
  // List<NoteFolders> folderListterr = [
  //  // allNoteFol, ideaFol,todoFol,randomFol,writeUpFol,
  //];
  //List<Note> noteList = [];
  void addNoteFolder(List<NoteFolders> list1, List<NoteFolders> list2, NoteFolders newNoteFolder,){
   // if(titleController.text.isNotEmpty && contentController.text.isNotEmpty){
      //noteID++;
      //_addNewNotes.add(newNoteFolder.note);
      list1.add(newNoteFolder);
      list2.add(newNoteFolder);
      print('new note folder added');
      notifyListeners();
      // titleController.clear();
      // contentController.clear();
      // locator<NavigationService>().pop();
      // print(newNote);
      // print(list.length);
      // print(newNote.title);
      // print(newNote.content);
      // print(newNote.color);
  //   }
  //   else{print('tiltle and content of new note cannot be empty');}
   }
 // void addNoteFolderr(List<NoteFolders> list1, NoteFolders newNoteFolder){
  //   // if(titleController.text.isNotEmpty && contentController.text.isNotEmpty){
  //   //noteID++;
  //   list1.add(newNoteFolder);
  //   print('new note folder added');
  //   notifyListeners();
  // }
  NoteFolders get ideaFol {
    return NoteFolders(
        folderTitle: 'Idea', color: Colors.blue,note: _ideasNoteList,);
  }
  NoteFolders get todoFol {
    return NoteFolders(
       folderTitle: 'Todo', color: Colors.red,note: _toDoNoteListt);
  }
  NoteFolders get writeUpFol {
    return NoteFolders(
       folderTitle: 'Write Up', color: Colors.yellow,note: _writeUpsNoteList);
  }
  NoteFolders get randomFol {
    return NoteFolders(
       folderTitle: 'Random', color: Colors.orange,note: _randomNoteList);
  }

  NoteFolders get allNoteFol {
    return NoteFolders(
        folderTitle: 'All', color: Colors.teal, note: _allNote,);
  }



  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Color pickerColor = Colors.yellow;
  Color currentColor = Colors.yellow;
  void changeColor(Color color) {
    pickerColor = color;
    print(color);
    notifyListeners();
  }
  get colorPicked{
    print(pickerColor);
    print('picked');
    notifyListeners();
   return currentColor = pickerColor;
   print(pickerColor);
   print('picked');
   notifyListeners();
  }
}


//  final noteStuffs = ChangeNotifierProvider((ref) => NoteStuff());
// class NoteStuff extends ChangeNotifier{
//
//   List<NoteFoldered> foldList = [
//     NoteFoldered(
//         note: [
//       Note(title: 'one one one',color: Colors.orange,noteFoldersTag: 'raw'),
//       Note(title: 'one nnvknv vmlsf',color: Colors.pink,noteFoldersTag: 'raw'),
//       Note(title: 'ophne ofkkfne one',color: Colors.purple,noteFoldersTag: 'raw'),
//       Note(title: 'vvvvomdnsssne one one',color: Colors.red,noteFoldersTag: 'raw'),
//      ],
//         folderTitle: 'Idea',
//     color: Colors.blue,
//     length: 0)
//   ];
// }