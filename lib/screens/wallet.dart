// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/service/database.dart';
import 'package:food_app/service/sharedpref.dart';
import 'package:food_app/utils/app_constant.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  TextEditingController amountcontroller = TextEditingController();

  getthesharedpref() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 2.0,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Center(
                  child: Text(
                "Wallet",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/wallet.png",
                  height: 60,
                  width: 60.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 40.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Wallet",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "\$0",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Add Money",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  makePayment('100');
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '\$' "100",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  makePayment('500');
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '\$' "500",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  makePayment('1000');
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '\$' "1000",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  makePayment('2000');
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '\$' "2000",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              openEdit();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFF008080),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Najaf'))
          .then((value) {});
      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception $e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        add = int.parse(wallet!) + int.parse(amount);
        await SharedPreferenceHelper().saveUserWallet(add.toString());
        await DatabaseMethods().UpdateUserwallet(id!, add.toString());
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successful")
                        ],
                      )
                    ],
                  ),
                ));
        await getthesharedpref();
        paymentIntent = null;
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      }).onError((error, StackTrace) {
        print("Error is:----> $error $StackTrace");
      });
    } on StripeException catch (e) {
      print('Error is:---> $e ');
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled"),
              ));
    } catch (e) {
      print("$e");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_type[]': 'card',
      };

      var response = await http.post(
        Uri.parse('http://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print('Payment Intent Body->>>${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount) * 100);

    return calculateAmount.toString();
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel)),
                      SizedBox(
                        width: 60.0,
                      ),
                      Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                              color: Color(0xFF008080),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Amount"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      controller: amountcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Amount",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        makePayment(amountcontroller.text);
                      },
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF008080),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}
