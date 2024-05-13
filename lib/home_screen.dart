import 'package:flutter/material.dart';
import 'package:productsales/data/card_data.dart';
import 'package:productsales/widget/alert_dialog.dart';
import 'package:productsales/widget/home_screen_title.dart';
import 'package:productsales/widget/shopping_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // @override
  // void initState() {
  //   calculateTotalPrice();
  //   super.initState();
  // }

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
            const HomeScreenTitle(),
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
            Column(
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
                        '${calculateTotalPrice().toString()}\$',
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
                SizedBox(
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  int calculateTotalPrice() {
    int totalAmount=0;
    for (CardData element in contents) {
      totalAmount = totalAmount +element.dressPrice;
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
