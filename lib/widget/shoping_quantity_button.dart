import 'package:flutter/material.dart';

class ShopingQuntityButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const ShopingQuntityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurStyle: BlurStyle.normal,
            blurRadius: 15,
            spreadRadius: 8,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: IconButton(
          alignment: Alignment.center,
          onPressed: () => onPressed(),
          icon: Icon(
            icon,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}
