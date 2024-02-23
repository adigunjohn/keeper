import 'package:flutter/material.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({Key? key, this.color, this.title, required this.length}) : super(key: key);
 final String? title;
 final int? length;
 final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          left: 4.0,
          right: 4.0),
      child: Container(
        // height: 100,
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color ?? Colors.yellow),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.folder_copy_outlined, size: 36,),
              Text(
                title ?? 'New Folder',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                '$length notes',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
