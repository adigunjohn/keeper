import 'package:flutter/material.dart';

class FolderCreateWidget extends StatelessWidget {
  const FolderCreateWidget({Key? key, required this.color, this.text, this.ontap}) : super(key: key);
  final Color? color;
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // height: MediaQuery.sizeOf(context).height * 0.125,
            // width: double.infinity,
            // width: MediaQuery.sizeOf(context).width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: color,
            ),
            child: Center(child: Text(
              text.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 13.3,
                  //fontStyle: FontStyle.italic
                // color: Colors.white
              ),
            ),),
          ),
        ),
      ),
    );
  }
}
