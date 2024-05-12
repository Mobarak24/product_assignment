import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAlertDialog extends StatelessWidget {
  const HomeAlertDialog({super.key, required this.contentText});
   final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.only(top: 30, bottom: 40),
      title: Text(
        'Congratulations!',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Text(
        contentText,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.14,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(219, 48, 34, 1),
              elevation: 5,
              shadowColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(
              'OKEY',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
