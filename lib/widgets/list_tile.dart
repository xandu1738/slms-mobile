import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback? onClicked;
  final IconData leadingIcon;
  final String titleText;
  //final String subs;
  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.titleText,
    this.onClicked,
    //required this.subs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 245, 222, 160),
            child: Icon(
              leadingIcon,
              color: Colors.blue,
            ),
          ),
          title: Text(
            titleText,
            style: GoogleFonts.roboto(
              fontSize: 15,
            ),
          ),
          // subtitle: Text(
          //   subs,
          //   style: GoogleFonts.roboto(
          //     fontSize: 10,
          //   ),
          // ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
