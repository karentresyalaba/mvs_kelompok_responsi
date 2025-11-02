// lib/widgets/custom/credit_card_widget.dart
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiry;
  final String cvv;
  final bool isVisa;
  final bool isSelected;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CreditCardWidget({
    Key? key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiry,
    required this.cvv,
    required this.isVisa,
    required this.isSelected,
    required this.onTap,
    this.backgroundColor = const Color(0xFFFFA726),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: backgroundColor == const Color(0xFFFFA726)
                              ? Colors.black
                              : Colors.white,
                          width: 2,
                        ),
                        color: isSelected
                            ? (backgroundColor == const Color(0xFFFFA726)
                            ? Colors.black
                            : Colors.white)
                            : Colors.transparent,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'CREDIT CARD',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: backgroundColor == const Color(0xFFFFA726)
                            ? Colors.black
                            : Colors.white,
                        fontFamily: 'TomatoGrotesk',
                      ),
                    ),
                  ],
                ),
                if (isVisa)
                  Text(
                    'VISA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: backgroundColor == const Color(0xFFFFA726)
                          ? Colors.black
                          : Colors.white,
                      fontFamily: 'TomatoGrotesk',
                    ),
                  ),
              ],
            ),
            Text(
              cardNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                color: backgroundColor == const Color(0xFFFFA726)
                    ? Colors.black
                    : Colors.white,
                fontFamily: 'TomatoGrotesk',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardHolder,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: backgroundColor == const Color(0xFFFFA726)
                        ? Colors.black
                        : Colors.white,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'EXP',
                      style: TextStyle(
                        fontSize: 10,
                        color: backgroundColor == const Color(0xFFFFA726)
                            ? Colors.black54
                            : Colors.white70,
                        fontFamily: 'TomatoGrotesk',
                      ),
                    ),
                    Text(
                      expiry,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: backgroundColor == const Color(0xFFFFA726)
                            ? Colors.black
                            : Colors.white,
                        fontFamily: 'TomatoGrotesk',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'CVV',
                      style: TextStyle(
                        fontSize: 10,
                        color: backgroundColor == const Color(0xFFFFA726)
                            ? Colors.black54
                            : Colors.white70,
                        fontFamily: 'TomatoGrotesk',
                      ),
                    ),
                    Text(
                      cvv,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: backgroundColor == const Color(0xFFFFA726)
                            ? Colors.black
                            : Colors.white,
                        fontFamily: 'TomatoGrotesk',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}