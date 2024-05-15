import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/model/locator.dart';
import 'package:keeper/model/navigation_service.dart';
import 'package:keeper/ui/data/note.dart';
import 'package:keeper/ui/screens/createnote_screen.dart';
import 'package:keeper/view_model/note_provider.dart';

class NoteScreen extends ConsumerWidget {
  const NoteScreen({this.color, this.folderNameTag, this.titleText, this.time, this.mainText, this.notelist, this.noteId, Key? key})
      : super(key: key);
  static const String id = 'NoteScreen';
  final Color? color;
  final String? folderNameTag;
  final String? titleText;
  final String? time;
  final String? mainText;
  final List<Note>? notelist;
  final int? noteId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(NoteModel);
    final read = ref.read(NoteModel.notifier);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 15.0, left: 15.0, right: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          locator<NavigationService>().pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '$titleText',
                          maxLines: 4,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          child: Text(
                            '$folderNameTag',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Last eddited, $time pm',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 13.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: color,
                      //border: Border.all(color: color as Color, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(28)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(mainText.toString(),
                            maxLines: 1000,
                            style: TextStyle(fontSize: 15),),
                        ),
                  ),),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        minWidth: MediaQuery.sizeOf(context).width * 0.01,
                        // minWidth: 10,
                        // elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: color,
                        onPressed: () {
                          print('editing note....');
                          // if ('yoh'== 'yoh'){
                          //   print(true);
                          // }
                          // else{print(false);}
                          locator<NavigationService>().push(CreateNoteScreen(navigatingFromWhere: 2, folderNameTag: folderNameTag, notelist: notelist,titleText: titleText, time: time, mainText: mainText,color: color,noteId: noteId,));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Edit',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 15.5),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.edit,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      MaterialButton(
                        minWidth: MediaQuery.sizeOf(context).width * 0.01,
                        // minWidth: 10,
                        // elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: color,
                        onPressed: () {
                          print('deleting note....');
                         // locator<NavigationService>().push(CreateNoteScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Delete',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 15.5),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.delete,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
