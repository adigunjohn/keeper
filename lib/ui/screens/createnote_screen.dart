import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/model/locator.dart';
import 'package:keeper/model/navigation_service.dart';
import 'package:keeper/ui/data/note.dart';
import 'package:keeper/view_model/note_provider.dart';
import 'package:provider/provider.dart';

class CreateNoteScreen extends ConsumerStatefulWidget {
  CreateNoteScreen(
      {Key? key,
      this.navigatingFromWhere,
      this.folderNameTag,
      this.notelist,
      this.color,
      this.mainText,
      this.time,
      this.titleText,
        this.noteId,})
      : super(key: key);
  static const String id = 'CreateNoteScreen';
  String? folderNameTag;
  List<Note>? notelist;
  int? navigatingFromWhere;
  //1 is navigating from homescreen
  //2 is navigating from notescreen

  Color? color;
  String? titleText;
  String? time;
  String? mainText;
  int? noteId;

  @override
  ConsumerState<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.navigatingFromWhere == 1) {
      //do something
    } else if (widget.navigatingFromWhere == 2) {
      //do something
      ref.read(NoteModel.notifier).currentColor = widget.color as Color;
      ref.read(NoteModel.notifier).pickerColor = widget.color as Color;
      ref.read(NoteModel.notifier).contentController.text =
          widget.mainText.toString();
      ref.read(NoteModel.notifier).titleController.text =
          widget.titleText.toString();
      //ref.read(NoteModel.notifier).noteID = widget.noteId as int;
      //       title: watch.titleController.text,
      // content: watch.contentController.text,
      // color: read.currentColor,
      // noteFoldersTag: widget.folderNameTag,
    }
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(NoteModel);
    final read = ref.read(NoteModel.notifier);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 0.0, left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      locator<NavigationService>().pop();
                      read.titleController.clear();
                      read.contentController.clear();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'New ${widget.folderNameTag} note',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.navigatingFromWhere == 1) {
                        read.addNote(
                          widget.notelist!,
                          Note(
                            title: watch.titleController.text,
                            content: watch.contentController.text,
                            color: read.currentColor,
                            noteFoldersTag: widget.folderNameTag,
                            noteId: watch.noteID,
                          ),
                        );
                        print('after safe notifier');
                      } else if (widget.navigatingFromWhere == 2) {
                        print(widget.notelist);
                        print(widget.notelist!.length);
                        //save the edited version of the note
                        read.editNote(
                          Note(
                            title: watch.titleController.text,
                            content: watch.contentController.text,
                            color: read.currentColor,
                            noteFoldersTag: widget.folderNameTag,
                            noteId: widget.noteId as int,
                          ),
                          Note(
                            title: widget.titleText,
                            content: widget.mainText,
                            color: widget.color,
                            noteFoldersTag: widget.folderNameTag,
                            noteId: widget.noteId as int,
                          ),
                          widget.notelist!,
                        );
                        // read.titleController.clear();
                        // read.contentController.clear();
                      }
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tap to choose a color',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Pick a color!',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        content: SingleChildScrollView(
                          // child: ColorPicker(
                          //   pickerColor: pickerColor,
                          //   onColorChanged: changeColor,
                          // ),
                          child: BlockPicker(
                            pickerColor: watch.pickerColor,
                            onColorChanged: read.changeColor,
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: Colors.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Got it',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onPressed: () {
                              read.colorPicked;
                              locator<NavigationService>().pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      // color: currentColor,
                      color: read.currentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: watch.titleController,
                maxLines: 1,
                // minLines: 12,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  //hintText: 'Title...',
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(color: Colors.yellow, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(color: Colors.yellow, width: 1.5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: watch.contentController,
                  maxLines: 150,
                  // minLines: 16,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Note...',
                    //labelText: 'Note',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.yellow, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.yellow, width: 1.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
