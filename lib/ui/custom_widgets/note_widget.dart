import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key, this.title, this.content, this.date, this.folderTag, this.color, this.ontapForPin}) : super(key: key);
  final String? date;
  final String? title;
  final String? content;
  final String? folderTag;
  final Color? color;
  final void Function()? ontapForPin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 4.0, bottom: 6.0, left: 4.0, right: 4.0),
      child: Container(
        height: 150,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color ?? Colors.yellow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$date',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11.5,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      title.toString(),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11.2,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Text(
                        content ?? '# To add custom fonts to your application, add a fonts section here, in this flutter section. Each entry in this list should have a family key with the font family name, and a fonts key with a list giving the asset and other descriptors for the font. For example:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10.8,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // left: 0,
                // top: 0,
                  right: 0.1,
                  bottom: 0.1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                      child: Text(
                        folderTag.toString(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                // left: 0,
                top: 40,
                  right: 0.1,
                  // bottom: 0.1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                      child: GestureDetector(
                        onTap: ontapForPin,
                        child: Icon(Icons.push_pin_outlined),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

