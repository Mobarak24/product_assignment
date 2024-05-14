import 'package:flutter/material.dart';
import 'package:productsales/data/card_data.dart';
import 'package:productsales/widget/alert_dialog.dart';
import 'package:productsales/widget/home_screen_bottom.dart';
import 'package:productsales/widget/shopping_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'My Bag',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ShoppingCard(
                    index: index,
                    incressButton: () => _incressQuantity(index),
                    decressButton: () => _decressQuantity(index),
                  );
                },
              ),
            ),
            HomeScreenBottom(totalAmount: _getTotalAmount()),
          ],
        ),
      ),
    );
  }

  int _getTotalAmount() {
      int totalAmount=0;
    for (CardData element in contents) {
      totalAmount += element.dressPrice * element.quantity;
    }
    return totalAmount;
  }

  _incressQuantity(int index) {
    if (contents[index].quantity < 5) {
      contents[index].quantity = contents[index].quantity + 1;
    }
    if (contents[index].quantity == 5) {
      showDialog(
        context: context,
        builder: (context) {
          return HomeAlertDialog(
            contentText:
                "You have added \n 5 \n ${contents[index].dressName} on your bag!",
          );
        },
      );
    }

    setState(() {});
  }

  _decressQuantity(int index) {
    if (contents[index].quantity > 1) {
      contents[index].quantity = contents[index].quantity - 1;
    }
    setState(() {});
  }
}
