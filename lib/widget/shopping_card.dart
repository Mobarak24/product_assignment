import 'package:flutter/material.dart';
import 'package:productsales/data/card_data.dart';
import 'package:productsales/widget/shoping_quantity_button.dart';

class ShoppingCard extends StatelessWidget {
  final Function incressButton, decressButton;
  final int index;

  const ShoppingCard({
    super.key,
    required this.index,
    required this.incressButton,
    required this.decressButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.30,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildCardImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bulidCardHeader(),
                  _buildCardDiscription(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCardButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardImage() {
    return AspectRatio(
      aspectRatio: 16 / 16,
      child: Container(
        height: 104,
        width: 104,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              contents[index].dressImage,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bulidCardHeader() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              contents[index].dressName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
          ),
          const FittedBox(
            fit: BoxFit.cover,
            child: Icon(
              Icons.more_vert,
              color: Color.fromRGBO(201, 201, 201, 1),
              size: 48,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDiscription() {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Color: ',
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              contents[index].dressColor,
              style: const TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Size: ',
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              contents[index].dressSize,
              style: const TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardButton() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: ShopingQuntityButton(
                  onPressed: decressButton,
                  icon: Icons.remove,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  contents[index].quantity.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: ShopingQuntityButton(
                  onPressed: incressButton,
                  icon: Icons.add,
                ),
              ),
            ],
          ),
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "${contents[index].dressPrice * contents[index].quantity}\$",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}