import 'package:flutter/material.dart';
import 'package:productsales/widget/home_screen_bottom_button.dart';

class HomeScreenBottom extends StatelessWidget {
  final int totalAmount;

  const HomeScreenBottom({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Total amount:',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${totalAmount.toString()}\$',
                style: const TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const BottomButton(),
      ],
    );
  }
}
