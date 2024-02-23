import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/view_model/keeper_provider.dart';

class PlayfulHomeScreen extends ConsumerWidget {
  const PlayfulHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(keeperNotifierProvider);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.yellowAccent,centerTitle: true, title: Text('Fucking with yah!'),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent,
        onPressed: () {
         ref.read(keeperNotifierProvider.notifier).calc();
         //  ref.read(keeperNotifierProviderr).calc();
        },
        child: Icon(
          Icons.edit_note,
          size: 30,
          color: Color(0xff000000),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('10 multiplied by ${model.yoh} '),
                Text('Result: ${model.answer} '),
                SizedBox(height: 30,),
                // Text('5 multiplied by ${ref.watch(keeperNotifierProviderr).yoh} '),
                // Text('Result: ${ref.watch(keeperNotifierProviderr).answer} '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
