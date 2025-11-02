// lib/screens/cart/payment_page.dart
import 'package:flutter/material.dart';
import '../../widgets/custom/credit_card_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = 'upi';
  final TextEditingController upiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'TomatoGrotesk',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Credit/Debit Card',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'TomatoGrotesk',
                          ),
                        ),
                        Text(
                          'Add Card',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFA726),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'TomatoGrotesk',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        CreditCardWidget(
                          cardNumber: '**** **** **** 4532',
                          cardHolder: 'ROOPA SMITH',
                          expiry: '14/07',
                          cvv: '012',
                          isVisa: true,
                          isSelected: selectedPaymentMethod == 'card1',
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = 'card1';
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        CreditCardWidget(
                          cardNumber: '**** **** **** 8976',
                          cardHolder: 'ROOPA SMITH',
                          expiry: '10/25',
                          cvv: '345',
                          isVisa: false,
                          isSelected: selectedPaymentMethod == 'card2',
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = 'card2';
                            });
                          },
                          backgroundColor: Colors.grey[800]!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RadioListTile<String>(
                        value: 'cod',
                        groupValue: selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentMethod = value!;
                          });
                        },
                        activeColor: const Color(0xFFFFA726),
                        title: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFA726).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.attach_money,
                                color: Color(0xFFFFA726),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Cash on Delivery(Cash/UPI)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'TomatoGrotesk',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedPaymentMethod == 'upi'
                              ? const Color(0xFFFFA726)
                              : Colors.grey[300]!,
                          width: selectedPaymentMethod == 'upi' ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          RadioListTile<String>(
                            value: 'upi',
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                            },
                            activeColor: const Color(0xFFFFA726),
                            title: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFA726)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Color(0xFFFFA726),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'Google Pay/Phone Pay/BHIM UPI',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'TomatoGrotesk',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (selectedPaymentMethod == 'upi')
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Link Via UPI*',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'TomatoGrotesk',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: upiController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your UPI ID',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: 'TomatoGrotesk',
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color(0xFFFFA726),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                      ),
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontFamily: 'TomatoGrotesk',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFA726)
                                              .withOpacity(0.2),
                                          borderRadius:
                                          BorderRadius.circular(6),
                                        ),
                                        child: const Icon(
                                          Icons.check_circle_outline,
                                          color: Color(0xFFFFA726),
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Your UPI ID Will be encrypted and is 100% safe with us.',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                            fontFamily: 'TomatoGrotesk',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA726),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    upiController.dispose();
    super.dispose();
  }
}