import 'package:flutter/material.dart';

class Note{
  Note({this.title, this.content,this.editedTime, this.color, this.noteFoldersTag, this.checkBoxBool = false, required this.noteId});
  final String? title;
  final String? content;
  final DateTime? editedTime;
  final Color? color;
  //final NoteFolders? noteFoldersTag;
  final String? noteFoldersTag;
  final bool? checkBoxBool;
  final int noteId;
}

class NoteFolders{
  NoteFolders({this.folderTitle, this.color, this.length, this.note });
 final String? folderTitle;
 final Color? color;
 final int? length;
 final List<Note>? note;
}

class NoteFoldered{
  NoteFoldered({this.folderTitle, this.color, this.length, this.note });
  final String? folderTitle;
  final Color? color;
  final int? length;
  final List<Note>? note;
}