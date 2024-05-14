import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.14,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully your order'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(219, 48, 34, 1),
          elevation: 5,
          shadowColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'CHECK OUT',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
