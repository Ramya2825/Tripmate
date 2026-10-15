import 'package:ecommerce_app/cardpage.dart';
import 'package:flutter/material.dart';

class Customizetrippage extends StatefulWidget {
  final Map<String, dynamic> tripDetail;
  final int days;
  final int people;

  const Customizetrippage({
    super.key,
    required this.tripDetail,
    required this.days,
    required this.people,
  });

  @override
  State<Customizetrippage> createState() =>
      CustomizetrippageState();
}

class CustomizetrippageState extends State<Customizetrippage> {
  final TextEditingController destinationController =
      TextEditingController();

  int days = 2;
   int people =1;

  double budget = 5000;

  String travelType = "Car";
  String stayType = "Budget";

  final List<String> interestNames = [
    "Nature",
    "Beach",
    "Food",
    "Shopping",
  ];

  @override
  void initState() {
    super.initState();
    days = widget.days;
    people = widget.people;
  }

  @override
  void dispose() {
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize Trip"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Where do you want to go?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  TextField(
                    controller: destinationController,
                    decoration: InputDecoration(
                      hintText: "Example: Ooty",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "How many days?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (days > 1) {
                            setState(() {
                              days--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove_circle, size: 35),
                      ),

                      Text(
                        "$days Days",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          if (days < 7) {
                            setState(() {
                              days++;
                            });
                          }
                        },
                        icon: Icon(Icons.add_circle, size: 35),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  Text(
                    "How many people?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (people > 1) {
                            setState(() {
                              people--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove_circle, size: 35),
                      ),

                      Text(
                        "$people People",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            people++;
                          });
                        },
                        icon: Icon(Icons.add_circle, size: 35),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Budget per person",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Center(
                    child: Text(
                      "₹${budget.toInt()}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Slider(
                    value: budget,
                    min: 2000,
                    max: 15000,
                    divisions: 26,
                    label: "₹${budget.toInt()}",
                    onChanged: (value) {
                      setState(() {
                        budget = value;
                      });
                    },
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Choose Travel type",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: ["Car", "Bus", "Train"].map((type) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              travelType = type;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: travelType == type
                                  ? Colors.indigo
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.indigo),
                            ),
                            child: Text(
                              type,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: travelType == type
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Stay preference",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: ["Budget", "Premium"].map((type) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              stayType = type;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: stayType == type
                                  ? Colors.indigo
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.indigo),
                            ),
                            child: Text(
                              type,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: stayType == type
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 247, 247),
                        foregroundColor: Colors.indigo,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TripPlanPage(
                              trip: widget.tripDetail,
                              days: days,
                              people: people,
                              budget: budget.toInt(),
                              travelType: travelType,
                              stayType: stayType,
                            ),
                          ),
                        );
                      },
                      child:  Text(
                        "Create My Trip",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
