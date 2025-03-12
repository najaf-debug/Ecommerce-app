import 'package:flutter/material.dart';
import 'package:food_app/screens/details.dart';
import 'package:food_app/utils/text_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool fastfood = false, fruits = false, salad = false, vegetables = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 50.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: "Hello Najaf,"),
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            TextWidget(
              text: "Delicious Food",
              fontSize: 24,
            ),
            TextWidget(
              text: 'Discover and Get Delicious Food',
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(margin: EdgeInsets.only(right: 15.0), child: showItem()),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/vegetables3.png',
                                height: 140,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              TextWidget(
                                text: "Veggie & Spices",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              TextWidget(
                                text: "Freshly Harvested",
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              TextWidget(
                                text: "\$15",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/vegetables2.png',
                              height: 140,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            TextWidget(
                              text: "Vegetables",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            TextWidget(
                              text: "Fresh and Healthy",
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            TextWidget(
                              text: "\$25",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/onion.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextWidget(
                              text: "Red Onion",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextWidget(
                              text: "\$2",
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            fastfood = false;
            fruits = false;
            salad = true;
            vegetables = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              decoration: BoxDecoration(
                  color: salad
                      ? const Color.fromARGB(255, 200, 200, 200)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/salad.png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            fastfood = true;
            fruits = false;
            salad = false;
            vegetables = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              decoration: BoxDecoration(
                  color: fastfood
                      ? const Color.fromARGB(255, 200, 200, 200)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/fast_food.png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            fastfood = false;
            fruits = true;
            salad = false;
            vegetables = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              decoration: BoxDecoration(
                  color: fruits
                      ? const Color.fromARGB(255, 200, 200, 200)
                      : Colors.white),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/fruits.png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            fastfood = false;
            fruits = false;
            salad = false;
            vegetables = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              decoration: BoxDecoration(
                  color: vegetables
                      ? const Color.fromARGB(255, 200, 200, 200)
                      : Colors.white),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/vegetables.png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
