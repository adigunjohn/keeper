import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keeper/model/locator.dart';
import 'package:keeper/model/navigation_service.dart';
import 'package:keeper/ui/custom_widgets/folder_widget.dart';
import 'package:keeper/ui/custom_widgets/note_widget.dart';
import 'package:keeper/ui/custom_widgets/pinned_folder.dart';
import 'package:keeper/ui/data/note.dart';
import 'package:keeper/ui/screens/createnote_screen.dart';
import 'package:keeper/ui/screens/note_screen.dart';
import 'package:keeper/view_model/note_provider.dart';
import '../custom_widgets/foldercreate_widget.dart';

//with SingleTickerProviderStateMixin
//final TabController _tabController = TabController(length: 3, vsync: this);
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin{
 // late TabController _tabController = TabController(length: ref.watch(NoteModel).folderList.length, vsync: this);
  @override
  // void initState() {
  //   super.initState();
  //   // Initialize the TabController
  //   _tabController = TabController(length: ref.watch(NoteModel).folderList.length, vsync: this);
  // }

  // @override
  // void dispose() {
  //   // Dispose of the TabController when the widget is disposed
  //   _tabController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context,) {
    TabController tabController = TabController(length: ref.watch(NoteModel).folderList.length, vsync: this);
    final watch = ref.watch(NoteModel);
    final read = ref.read(NoteModel.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FloatingActionButton(
          backgroundColor: Colors.yellowAccent,
          onPressed: () {
            print('floating action button tapped');
            showDialog(context: context, builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text(
                'Select a folder',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              content: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...read.folderListt.map((e) => FolderCreateWidget(color: e.color, text: e.folderTitle, ontap: (){
                      locator<NavigationService>().replace(CreateNoteScreen(navigatingFromWhere: 1,folderNameTag: e.folderTitle,notelist: e.note,));
                    },),),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      read.addNoteFolder(read.folderListt, read.somethingNew, NoteFolders(folderTitle: 'Waw', color: Colors.purple, note: []));
                      print('adding new folder');
                      print(read.folderListt.length);
                      locator<NavigationService>().pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black, style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Create a new folder',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                    ),
                  )
                    // StoreWidget(color: Colors.orange, text: 'Clothes Store',ontap: (){
                    //   locator<NavigationService>().pushNamed(CreateNoteScreen.id);
                    // },),
                  ],
                ),
              ),
            ));
            //locator<NavigationService>().pushNamed(CreateNoteScreen.id);
          },
          child: Icon(
            Icons.edit_note,
            size: 30,
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 0.0, left: 15.0, right: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome 😊',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Cristiano Ronaldo',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.settings_outlined),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 28.0),
                //   child: Divider(color: Colors.yellow,),
                // ),
                SizedBox(
                  height: 12,
                ),
                Visibility(
                  visible: read.pinnedNL,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Pinned notes --${watch.pinnedNotes.length}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: watch.pinnedNotes.length,
                            itemBuilder: (_, index) {
                             var pinnedd = watch.pinnedNotes[index];
                              return PinnedFolder(
                               //title: pinnedd.title,
                                title: '${pinnedd.title}  ${pinnedd.noteId}',
                                folderTag: pinnedd.noteFoldersTag,
                                color: pinnedd.color,
                                content: pinnedd.content,
                                // title: 'My new Idea to make money',
                                // folderTag: 'Idea',
                                date: '1st January',
                                onTap: (){
                                  print('planning to umpin note');
                                  read.unpinNote(pinnedd);
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Folders',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('adding new folder');
                          },
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.yellow,
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: watch.folderListt.length,
                          itemBuilder: (_, index) {
                            var folder = watch.folderListt[index];
                            return FolderWidget(
                              length: folder.note!.length,
                              title: folder.folderTitle,
                              color: folder.color,
                            );
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  // height: MediaQuery.sizeOf(context).height * 0.0625, //50
                  height: 50,
                  width: double.maxFinite,
                  child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(5),
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontSize: 12.85,
                        fontFamily: 'Poppins',
                      ),
                      // unselectedLabelStyle: TextStyle(fontSize: 12.85, fontFamily: 'Poppins', fontStyle: FontStyle.italic),
                      unselectedLabelColor: Colors.grey,
                      labelPadding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 1.0, bottom: 1.0),
                      // indicatorColor: Colors.red,
                      // indicatorSize: TabBarIndicatorSize.label,
                      // indicatorWeight: 3.0,
                      // indicator:  BoxDecoration(),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.yellow,
                      ),
                      // indicatorPadding: EdgeInsets.all(5.0),
                      tabs: [
                        ...watch.folderList.map((e) => Tab(text: e.folderTitle,)),
                      ]),
                ),
                // SizedBox(
                //   //height: MediaQuery.sizeOf(context).height * 0.009,
                //   height: 10,
                // ),
                Expanded(
                  child: Container(
                   // height: watch.pinnedNotes.length >= 1 ? 250 : 400,
                    child: TabBarView(
                        controller: tabController,
                        children: [
                      ...read.folderList.map((e) => ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: e.note!.length,
                          itemBuilder: (_, index) {
                            var noted = e.note![index];
                            return NoteWidget(title: noted.title,date: '2nd January', folderTag: noted.noteFoldersTag,color: noted.color, content: noted.content,
                            ontapForPin: (){
                              read.pinNote(noted);
                            },
                            ontap: (){
                              locator<NavigationService>().push(NoteScreen(notelist: e.note,time: '${DateTime.now().hour}:${DateTime.now().minute}',titleText: noted.title, folderNameTag: noted.noteFoldersTag, color: noted.color, mainText: noted.content, noteId: noted.noteId,));
                            },);
                            //return NoteWidget(title: 'eahhhhh',date: '2nd January', folderTag: 'fggggggg',color: Colors.blue,);
                          }),),
                      // ListView.builder(
                      //     scrollDirection: Axis.vertical,
                      //     itemCount: watch.allNoteFol.length,
                      //     itemBuilder: (_, index) {
                      //       var noted = watch.allNoteFol.note![index];
                      //       return NoteWidget(title: noted.title,date: '2nd January', folderTag: noted.noteFoldersTag,color: noted.color,);
                      //       //return NoteWidget(title: 'eahhhhh',date: '2nd January', folderTag: 'fggggggg',color: Colors.blue,);
                      //     }),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


